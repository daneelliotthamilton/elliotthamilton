class String

  def possessive
    suffix = if self.downcase == 'it'
      "s"
    elsif self.downcase == 'who'
      'se'
    elsif self.end_with?('s')
      "'"
    else
      "'s"
    end
    self + suffix
  end

  def to_bool
    return true if self == true || self=~ (/^(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/^(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end

end