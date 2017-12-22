#!groovy

import jenkins.model.*
import hudson.security.*
import jenkins.security.s2m.AdminWhitelistRule

def instance = Jenkins.getInstance()

// def user = new File("/run/secrets/jenkins-user").text.trim()
// def pass = new File("/run/secrets/jenkins-pass").text.trim()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
// Change from user/password from admin/admin upon startup
// or uncomment out the user pass from above and pass them into the function
// below
hudsonRealm.createAccount('admin', 'admin')
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)
// Jenkins will give warnings about deprecated protocols
// Get all the protocols and then remove all that are deprecated
HashSet<String> protocols = new HashSet<>(instance.getAgentProtocols());
protocols.removeAll(Arrays.asList(
    "CLI-connect",
    "JNLP-connect",
    "JNLP2-connect",
    "JNLP3-connect"
));
instance.setAgentProtocols(protocols);
instance.save()

Jenkins.instance.getInjector().getInstance(AdminWhitelistRule.class).setMasterKillSwitch(false)
