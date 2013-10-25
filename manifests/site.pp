# Site manifest which installs a clean Jenkins and configures OpenJDK 7 on it.

exec { "apt-get update":
    path => "/usr/bin"
}

package { [ "jenkins", "openjdk-7-jdk"] :
  ensure    => "installed",
  require   => Exec["apt-get update"]
}

class { "jenkins_config":

}

file { "/var/lib/jenkins/config.xml":
    source  => "puppet:///modules/jenkins_config/config.xml",
    replace => 'no'
}

jenkins_jdk { "JDK7":
    java_home   => "/usr/lib/jvm/java-7-openjdk-amd64",
    config_file => "/var/lib/jenkins/config.xml",
    require     => [ Package["jenkins", "openjdk-7-jdk"], File["/var/lib/jenkins/config.xml"], Class["jenkins_config"] ],
    notify      => Service["jenkins"]
}

service { "jenkins":
    ensure => "running"
}
