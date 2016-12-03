module ApplicationHelper

  def date_format(str)
    str = str.split(' ')
    #str.delete_at(2)
    date = str[0].split('-')
    date = date[2].to_s + '.' + date[1].to_s + '.' + date[0].to_s
    time = str[1].split(':')
    time = time[0].to_s + ':' + time[1].to_s
    str = time + ' ' + date
  end

end
