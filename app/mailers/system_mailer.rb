class SystemMailer < ApplicationMailer
  default from: email, to: email

  def system_request(system)
    @system = system
    mail subject: "JOIN system Request"
  end

  def system_iaApproved(system)
    @system = system
    mail subject: "JOIN Lab: Your system has an IA approval"
  end

  def system_atoApproved(system)
    @system = system
    mail subject: "JOIN Lab: Your System has an ATO approval"
  end

  def system_atoExpired(system)
    @system = system
    mail subject: "JOIN Lab: ATO has expired"
  end

  def system_added_ato(system)
    @system = system
    mail subject: "JOIN Lab: ATO has Added"
  end

end
