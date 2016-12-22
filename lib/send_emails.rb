@tests = Test.all
@labs = Lab.all
@systems = System.all
@encrypters = Encrypter.all

@tests.each do |test|

  if ( test.end_date < Time.now && !test.endEmail? )
    TestMailer.test_ended(test).deliver_now
    test.endEmail = true
    test.save
  end

  if ( test.start_date < Time.now && !test.startEmail? )
    TestMailer.test_started(test).deliver_now
    test.startEmail = true
    test.save
  end

end


@systems.each do |system|

  if (system.ato_Expiration < Time.now && !system.atoExpirationEmail? )
    SystemMailer.system_atoExpired(system).deliver_now
    system.atoExpirationEmail = true
    system.save
  end

end

@labs.each do |lab|

  if (lab.accredDate < Time.now && !lab.accredDateEmail )
    LabMailer.lab_accrediationExpired(lab).deliver_now
    lab.accredDateEmail = true
    lab.save
  end

  if (lab.loa_Expiration < Time.now && !lab.loaExpirationEmail )
    LabMailer.lab_loAExpired(lab).deliver_now
    lab.loaExpirationEmail = true
    lab.save
  end


end