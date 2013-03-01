require "parslet"

module Shortee

  class Shortee::Parser < Parslet::Parser

    # Generic rules
    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }
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
    rule(:amountnum) { match('[0-9.]').repeat(1).as(:amountnum) >> space? }
    rule(:amountunits) { match('[a-zA-Z]').repeat(1).as(:amountunits) >> space? }
    rule(:day) { match('[0-9]').repeat(1).as(:day) }
    rule(:month) { match('[a-zA-Z0-9]').repeat(1).as(:month) }
    rule(:year) { match('[0-9]').repeat(1).as(:year) }

    rule(:date) {
      (day >> forwardslash >> month >> forwardslash >> year)
    }

    rule(:short) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          amountnum >> amountunits >>
          date).as(:short)
    }

    rule(:shortwithactee) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          at >> actee.as(:actee) >>
          amountnum >> amountunits >>
          date).as(:short)
    }

    rule(:allshorts) { short | shortwithactee }

    root(:allshorts)
  end
end