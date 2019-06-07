# frozen_string_literal: true

require 'spec_helper'

describe USPSFlags::Burgees do
  it 'should return the list of available burgees from available' do
    expect(USPSFlags::Burgees.available).to eql([:birmingham])
  end

  it 'should raise USPSFlags::Errors::UnknownBurgee if an invalid burgee is entered' do
    @burgee = USPSFlags::Burgees.new do |b|
      b.squadron = :not_a_squadron
      b.outfile = ''
    end

    expect { @burgee.svg }.to raise_error(USPSFlags::Errors::UnknownBurgee)
  end

  it 'should generate a burgee from the builtins' do
    @burgee = USPSFlags::Burgees.new do |b|
      b.squadron = :birmingham
      b.outfile = ''
    end

    expect(@burgee.svg).to include(
      <<~SVG
        <?xml version="1.0" standalone="no"?>
        <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="1024" height="682" viewBox="0 0 3072 2048" preserveAspectRatio="xMidYMid meet">
        <title>Birmingham Burgee</title>
        <metadata>
        <desc id="created-by">Julian Fiander</desc>
      SVG
    )

    expect(@burgee.svg).to include(
      <<~SVG
        <desc id="trademark-desc">This image is a registered trademark of United States Power Squadrons.</desc>
        <desc id="trademark-link">https://www.usps.org/images/secretary/itcom/trademark.pdf</desc>
        </metadata>
        <g transform="translate(0.000000,2000.000000) scale(0.1,0.1)" fill="#1086FF" stroke="none">
        <polyline points="0,-20000 30000,-10000 0,0" fill="#1086FF" />
        <path d="M 22500 -10750
        l 1175.55 818.05
        l -414.7 -1370.85
        l 1141.25 -865.25
        l -1431.85 -29.15
        l -470.25 -1352.8
        l -470.25 1352.8
        l -1431.85 29.15
        l 1141.25 865.25
        l -414.7 1370.85
        l 1175.55 -818.05
        " fill="#FFFFFF" transform="scale(0.85)" />
        <path d="M 14000 -14500
        l 1175.55 818.05
        l -414.7 -1370.85
        l 1141.25 -865.25
        l -1431.85 -29.15
        l -470.25 -1352.8
        l -470.25 1352.8
        l -1431.85 29.15
        l 1141.25 865.25
        l -414.7 1370.85
        l 1175.55 -818.05
        " fill="#FFFFFF" transform="scale(0.85)" />
        <path d="M 14000 -7000
        l 1175.55 818.05
        l -414.7 -1370.85
        l 1141.25 -865.25
        l -1431.85 -29.15
        l -470.25 -1352.8
        l -470.25 1352.8
        l -1431.85 29.15
        l 1141.25 865.25
        l -414.7 1370.85
        l 1175.55 -818.05
        " fill="#FFFFFF" transform="scale(0.85)" />
        <path d="M 5800 -14250
        c-104.666,449.9807,-22.6957,1072.0206,423.5843,1684.371
        c316.7131,442.9167,836.5815,765.5356,1051.4854,1365.4361
        c120.2205,480.3001,374.2754,1457.993,-946.8351,3059.773
        c-648.359,934.0117,-1831.1951,2019.1478,-2023.2376,2506.6223
        c-964.4609,1882.8111,1386.3825,1616.3949,578.0677,508.3014
        c5.4606,-70.2644,222.4875,-178.2827,253.1148,-180.0513
        c56.7216,-17.4252,136.3628,-24.4061,167.0038,0.0007
        c161.1126,136.6123,430.9021,302.8633,597.5594,354.8821
        c-300.4308,315.5714,-335.1624,440.0042,-58.7118,704.5458
        c-274.1394,154.9454,-644.8725,192.1093,-665.4051,905.4727
        c-488.9256,-293.8771,-687.8155,-352.2895,-1071.1716,-10.437
        c-232.009,-232.2225,-143.7366,-684.5085,-965.4897,-605.3878
        c91.548,-244.4487,158.5041,-843.4501,-427.9466,-1064.6484
        c222.473,-163.7908,1012.1031,-322.0582,396.6337,-1085.5229
        c655.3237,-69.3559,837.3459,-311.7418,769.7821,-983.7558
        c858.7843,6.4381,655.3593,-504.4532,508.8389,-835.0187
        c998.7721,-520.9843,220.267,-996.9018,-41.7511,-1075.0854
        c491.9119,-618.1957,36.9677,-919.6739,-568.8601,-1550.007
        c-903.2258,906.223,-1639.9032,423.1217,-1925.7751,52.1536
        c-322.3945,-558.7984,648.2547,-2340.7437,934.1994,-2692.8736
        c186.812,1687.9158,1711.1362,1409.5262,735.8529,-10.4298
        c736.0593,-141.6665,243.3838,-1007.9676,177.444,-1273.4294
        c946.2568,-46.3264,448.6675,-750.6045,694.0893,-1205.5123
        c714.9975,583.3763,862.4609,-108.6177,1210.7799,-495.8427
        c348.319,797.1493,691.9312,313.4718,923.7179,182.6726
        c90.9139,291.8189,-123.4323,731.3063,829.8424,1351.6526
        c-325.0148,646.4338,-198.9636,1511.38,266.0925,1445.6675
        c68.5255,69.9427,84.6195,121.739,114.8447,193.0877
        c-157.6051,358.3116,-0.0898,329.9667,-26.0675,631.4773
        c-166.8505,9.3302,-334.916,20.169,-485.3875,83.4998
        c-265.2566,-500.1601,-648.6397,-660.7452,-887.1152,-913.3022
        c-170.648,-210.817,-460.8627,-530.3169,-537.5822,-1054.1948" fill="#FFFFFF" />
        </g>

        </svg>
      SVG
    )
  end

  it 'should generate a burgee from the custom directory' do
    @custom_file = "#{USPSFlags.configuration.burgees_dir}/birmingham.svg"
    ::FileUtils.mkdir_p(USPSFlags.configuration.burgees_dir)
    ::FileUtils.cp('lib/usps_flags/burgees/builtins/birmingham.svg', @custom_file)
    f = ::File.open(@custom_file, 'w+')
    f.write('<!-- Custom -->')
    f.close

    @burgee = USPSFlags::Burgees.new do |b|
      b.squadron = :birmingham
      b.outfile = ''
    end

    expect(@burgee.svg).to include('<title>Birmingham Burgee</title>')
    expect(@burgee.svg).to include('<!-- Custom -->')

    ::FileUtils.rm_rf(USPSFlags.configuration.burgees_dir)
  end

  it 'should generate a crossed-staves burgee' do
    @burgee = USPSFlags::Burgees.new do |b|
      b.squadron = :birmingham
      b.outfile = ''
    end

    expect(@burgee.svg(crossed: true)).to include('<g id="crossed-flags"')
    expect(@burgee.svg(crossed: true)).to include('<g id="flag-poles"')
  end
end
