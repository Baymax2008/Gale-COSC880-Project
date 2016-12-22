class LabMailer < ApplicationMailer

  default from: email, to: email

  def lab_request(lab)
    @lab = lab
    mail subject: "new Lab Request"
  end

  def lab_approved(lab)
    @lab = lab
    mail subject: "JOIN Lab: Your Lab has been approved"
  end

  def lab_accrediationExpired(lab)
    @lab = lab
    mail subject: "JOIN Lab: Your Lab's Accrediation has expired"
  end

  def lab_loAExpired(lab)
    @lab = lab
    mail subject: "JOIN Lab: LoA has expired"
  end

end
