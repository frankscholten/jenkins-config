Jenkins Config Puppet Module
============================

## The Problem


When using a Puppet template to configure things like a JDK in Jenkins' config.xml the template could override user created configuration such as views!


## The Solution


Configure the JDK in Jenkins via a custom Puppet type & provider which uses XPath expressions to manipulate the config.xml and leaving the rest of the config intact. Use the type like this:


```ruby
jenkins_jdk { "JDK7":
    java_home   => "/usr/lib/jvm/java-7-openjdk-amd64",
    config_file => "/var/lib/jenkins/config.xml"
}
```

## Blog

Read my accompanying <a href="http://blog.trifork.com/2013/10/29/puppet-from-the-trenches-how-to-prevent-overwritten-user-configuration-with-a-custom-type/">blog entry</a> on the topic for more background information.

## Show me!


```bash
$ vagrant up
```

This will install Jenkins and OpenJDK 7 and configure the JDK via a custom type.


## Bugs

Does not show a diff of the changes it will make to the config.xml

## Contact

Twitter: @Frank_Scholten
