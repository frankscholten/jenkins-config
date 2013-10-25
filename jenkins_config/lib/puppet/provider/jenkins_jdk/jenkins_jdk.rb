require 'rexml/document'
require 'rexml/xpath'
include REXML

Puppet::Type.type(:jenkins_jdk).provide :jenkins_jdk do
    desc "Jenkins JDK provider"

    def exists?
      read_config().root.elements["//jdks/jdk/name[. = '#{resource[:name]}']"] != nil
    end

    def create
      config = read_config()

      jdk = config.root.get_elements('jdks')[0].add_element('jdk')
      jdk.add_element('name').add_text(resource[:name])
      jdk.add_element('home').add_text(resource[:java_home])

      write_config(config)
    end

    def destroy
      config = read_config()

      config.root.delete_element("//jdks/jdk[name[. = '#{resource[:name]}']]")

      write_config(config)
    end

    def java_home
      resource[:java_home]
    end

    # Helper methods

    def read_config
      return Document.new File.read(resource[:config_file])
    end

    def write_config(config)
      File.open(resource[:config_file], 'w') do |f|
        config.write(f)
      end
    end
end
