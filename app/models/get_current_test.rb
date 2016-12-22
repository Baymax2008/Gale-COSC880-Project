class GetCurrentTest
  attr_reader :id

  def initialize(id)
    params ||= {}
    @id = id
    #@end_date = parsed_date(params[:end_date], @end_date.to_date.to_s)
  end

  def scope
    @current_date =  Date.today.to_s
    #Test.where('end_date > ? AND ? > start_date AND network_id = ?', @current_date, @current_date, @id )
    Test.where('? BETWEEN start_date AND end_date AND network_id = ?', @current_date, @id )
    #Test.where('end_date > ?', @current_date )
  end

  private

  def parsed_date(date_string, default)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end

  def parsed_id(find_id)
    find_id.to_int
  end

end