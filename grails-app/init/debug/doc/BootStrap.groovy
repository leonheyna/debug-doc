package debug.doc

class BootStrap {

    def init = { servletContext ->
        Role roleSuper
        Role.withTransaction {
            roleSuper = Role.findOrCreateByAuthority("ROLE_SUPER").save(failOnError: true)
        }
        User superUser //, adminUser, userUser, apiUser, guestUser
        User.withTransaction {
            superUser = User.findOrCreateByUsername("superUser")
            superUser.setPassword('superUser')
            superUser.save(failOnError: true)
            log.info("Bootstrap: created ${superUser}")
        }

        UserRole superUserRole //, adminUserRole, userUserRole, apiUserRole, guestUserRole
        UserRole.withTransaction {
            if (!UserRole.exists(superUser.id, roleSuper.id)) {
                superUserRole = UserRole.create(superUser, roleSuper)
                superUserRole.save(failOnError: true)
            }
        }

        UserRole.withTransaction { status ->
            UserRole.withSession {
                it.flush()
                it.clear()
            }
        }
    }
    def destroy = {
    }
}
