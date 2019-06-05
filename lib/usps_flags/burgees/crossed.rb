# frozen_string_literal: true

# Helper class for generating crossed-staves.
#
# @private
class USPSFlags::Burgees::Crossed
  def self.generate(svg)
    ensign = USPSFlags::Core::Ensign.new.svg
    <<~SVG
      <g transform="translate(2850, 200)">
        <g id="crossed-flags" transform="translate(0, 250)">
          <g id="flags">
            <g id="burgee" transform="translate(3000) rotate(30)">
              #{svg}
            </g>

            <g id="ensign" transform="scale(-0.9765625, 0.9765625) rotate(30)">
              #{ensign}
            </g>
          </g>

          <g id="flag-poles">
            <rect fill="#041E42" x="0" y="0" width="150" height="4000" transform="rotate(-30)" />
            <rect fill="#041E42" x="0" y="0" width="150" height="4000" transform="translate(2850) rotate(30, 150, 0)" />
          </g>
        </g>
      </g>
    SVG
  end
end
