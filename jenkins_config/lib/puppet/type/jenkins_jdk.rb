require 'pathname'

Puppet::Type.newtype(:jenkins_jdk) do

  desc = "Ensure that Jenkins is configured with the given JDK"

  ensurable

  validate do
    if self[:java_home] == nil || !Pathname.new(self[:java_home]).absolute?
      raise ArgumentError, "'java_home' is missing or is not a valid directory"
    end

    if self[:config_file] == nil || !Pathname.new(self[:config_file]).absolute?
      raise ArgumentError, "'config_file' is missing"
    end
  end

  newparam(:name, :namevar => true) do
    desc "The name of the JDK"
  end

  newparam(:config_file) do
    desc "Location of the Jenkins config.xml file"
  end

  newproperty(:java_home) do
    desc "The directory of the JDK"
  end

end