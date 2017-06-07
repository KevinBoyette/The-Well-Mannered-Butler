from time import sleep
from jenkinsapi.jenkins import Jenkins


def get_admin_password():
    with open('/var/jenkins_home/secrets/initialAdminPassword',
              'r') as init_password:
        return init_password.read().replace('\n', '')


def get_server_instances(jenkins_password):
    jenkins_url = 'http://localhost:8080'
    server = Jenkins(jenkins_url, username='admin', password=jenkins_password)
    return server


def get_plugin_details():
    # Refer Example #1 for definition of function 'get_server_instance'
    server = get_server_instances(get_admin_password())
    for plugin in server.get_plugins().values():
        print("Short Name:{}".format(plugin.shortName))
        print("Long Name:{}".format(plugin.longName))
        print("Version:{}".format(plugin.version))
        print("URL:{}".format(plugin.url))
        print("Active:{}".format(plugin.active))
        print("Enabled:{}".format(plugin.enabled))


if __name__ == '__main__':
    # Wait until Jenkins can be started
    sleep(30)
    print(get_server_instances(get_admin_password()).version)
    print(get_plugin_details())
