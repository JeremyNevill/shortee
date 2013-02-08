require "parslet"

module Shortee

  class ShorteeParser < Parslet::Parser

    # A space and many spaces
    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }

    # Other rules
    rule(:dash?) { match['_-'].maybe }
    rule(:at) { str('@') | (dash? >> (str('at') | str('AT')) >> dash?) }
    rule(:dot) { str('.') | (dash? >> (str('dot') | str('DOT')) >> dash?) }

    rule(:forwardslash) { match['/'] }

    rule(:integer) { match('[0-9]').repeat(1)>> space? }
    rule(:word) { match('[a-zA-Z0-9]').repeat(1).as(:word) >> space? }
    rule(:separator) { dot.as(:dot) >> space? | space }
    rule(:words) { word >> (separator >> word).repeat }

    # Shortee rules
    rule(:actor) { match('[a-zA-Z0-9]').repeat(1).as(:actor) >> space? }
    rule(:actee) { match('[a-zA-Z0-9]').repeat(1).as(:actee) >> space? }
    rule(:action) { match('[a-zA-Z]').repeat(1).as(:action) >> space? }
    rule(:amountnum) { match('[0-9.]').repeat(1).as(:amountnum) }
    rule(:amountunits) { match('[a-zA-Z]').repeat(1).as(:amountunits) >> space? }

    rule(:day) { match('[0-9]').repeat(1).as(:day) }
    rule(:month) { match('[a-zA-Z]').repeat(1).as(:month) }
    rule(:year) { match('[0-9]').repeat(1).as(:year) }
    rule(:ukmonth) { match('[0-9]').repeat(1).as(:ukmonth) }

    rule(:shorteeshort) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          amountnum >> amountunits >>
          day >> forwardslash >>
          month >> forwardslash >> year).as(:shortee)
    }

    rule(:shorteeukshort) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          amountnum >> amountunits >>
          day >> forwardslash >>
          ukmonth >> forwardslash >> year).as(:shortee)
    }

    rule(:shorteelong) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          at >> actee.as(:actee) >>
          amountnum >> amountunits >>
          day >> forwardslash >>
          month >> forwardslash >> year).as(:shortee)
    }

    rule(:shorteeuklong) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          at >> actee.as(:actee) >>
          amountnum >> amountunits >>
          day >> forwardslash >>
          ukmonth >> forwardslash >> year).as(:shortee)
    }

    rule(:allshorts) { shorteeshort | shorteeukshort | shorteelong | shorteeuklong }

    root(:allshorts)
  end
end