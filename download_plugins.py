from jenkinsapi.jenkins import Jenkins
from time import sleep
def get_admin_password():
    with open('/var/jenkins_home/secrets/initialAdminPassword', 'r') as init_password:
        password = init_password.read().replace('\n', '')
        return password

def get_server_instances(jenkins_password):
    jenkins_url = 'http://localhost:8080'
    server = Jenkins(jenkins_url, username='admin', password=jenkins_password)
    return server

def get_plugin_details():
    # Refer Example #1 for definition of function 'get_server_instance'
    server = get_server_instances(get_admin_password())
    for plugin in server.get_plugins().values():
        print "Short Name:%s" %(plugin.shortName)
        print "Long Name:%s" %(plugin.longName)
        print "Version:%s" %(plugin.version)
        print "URL:%s" %(plugin.url)
        print "Active:%s" %(plugin.active)
        print "Enabled:%s" %(plugin.enabled)

if __name__ == '__main__':
    # Wait until Jenkins can be started
    sleep(30)
    password = get_admin_password()
    print(get_server_instances(password).version)
    print(get_plugin_details())
