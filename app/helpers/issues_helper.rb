module IssuesHelper
  def cut_string(value)
    if value.to_s.length > 15
      value.to_s[0...9] + "(...)"
    else
      value.to_s
    end
  end

  def remove_nils(value)
    if value.nil?
      'none'
    else
      value
    end
  end
end
