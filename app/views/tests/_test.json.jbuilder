json.extract! test, :id, :name, :start_date, :end_date, :allLabMoA, :testProcedures, :network, :testNum,
              :created_at, :updated_at
json.url test_url(test, format: :json)