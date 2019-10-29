# return the base code of the code it is given

def reader(bar_code)
  clone_code = bar_code.clone
  return clone_code[0..-3].upcase if clone_code[-1].to_i.positive?

  clone_code.upcase
end
