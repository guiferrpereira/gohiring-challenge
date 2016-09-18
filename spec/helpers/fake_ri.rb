# frozen_string_literal: true
module Kernel
  # Internal: Mock call to Kernel system
  def `(cmd)
    case cmd
      when "ri Array#first --format=markdown"
        "# Array#first\n\n(from ruby core)\n---\n    ary.first     ->   "\
        "obj or nil\n    ary.first(n)  ->   new_ary\n\n---\n\nReturns the "\
        "first element, or the first `n` elements, of the array. If the\narray "\
        "is empty, the first form returns `nil`, and the second form returns "\
        "an\nempty array. See also Array#last for the opposite effect.\n\n    "\
        "a = [ \"q\", \"r\", \"s\", \"t\" ]\n    a.first     #=> \"q\"\n    a.first(2)  #=> [\"q\", \"r\"]\n\n\n"
      when "ri OOOOOOO --format=markdown"
        ""
    end
  end
end
