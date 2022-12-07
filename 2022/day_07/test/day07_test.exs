defmodule Day07Test do
  use ExUnit.Case
  doctest Day07

  @input ~S{
    $ cd /
    $ ls
    dir csjncqmr
    dir fnfjhvsp
    dir mhfrct
    dir pgmgbfcl
    dir qcf
    dir wrsjr
    $ cd csjncqmr
    $ ls
    8827 vdrdm.pfj
    $ cd ..
    $ cd fnfjhvsp
    $ ls
    dir csjncqmr
    dir czpmg
    162385 dcgph
    7135 hff.cdt
    $ cd csjncqmr
    $ ls
    121543 gzjdsn.wlc
    dir ljq
    $ cd ljq
    $ ls
    dir cwlrlvf
    dir jpqjhhpg
    $ cd cwlrlvf
    $ ls
    151219 dcgph
    $ cd ..
    $ cd jpqjhhpg
    $ ls
    188355 dcgph
    38458 gfgl.hlg
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd czpmg
    $ ls
    168232 dcgph
    143031 gzjdsn.wlc
    $ cd ..
    $ cd ..
    $ cd mhfrct
    $ ls
    dir clm
    66710 dcgph
    232576 mtfhpcnj
    $ cd clm
    $ ls
    dir pgmgbfcl
    $ cd pgmgbfcl
    $ ls
    110296 qbfhj.tmn
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd pgmgbfcl
    $ ls
    163613 cgchl
    dir nnlr
    123977 rrwbnmlh.jtt
    dir tjhzggs
    dir wfl
    252837 wpgrl
    $ cd nnlr
    $ ls
    103051 flp
    dir qrhlzd
    dir rcgmhz
    dir snwrlr
    dir vgj
    dir znbzt
    $ cd qrhlzd
    $ ls
    dir crg
    246915 dcgph
    264791 fcphzfb.fmb
    299291 flp
    dir mjqsg
    297202 pgmgbfcl
    dir sbbzgbz
    dir wnsnssbg
    $ cd crg
    $ ls
    55556 flp
    185529 jswdvn
    $ cd ..
    $ cd mjqsg
    $ ls
    dir fnfjhvsp
    dir jfbzjz
    dir rwg
    $ cd fnfjhvsp
    $ ls
    24945 cctwbs
    170960 csjncqmr
    316168 ljffgvvz.zld
    187325 pgmgbfcl.fzv
    74133 qbfhj.tmn
    dir tjhzggs
    dir vjmgmdz
    $ cd tjhzggs
    $ ls
    287777 csjncqmr.nbd
    $ cd ..
    $ cd vjmgmdz
    $ ls
    dir vgpb
    $ cd vgpb
    $ ls
    202578 bbbg.hlr
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd jfbzjz
    $ ls
    207736 tjhzggs.cql
    $ cd ..
    $ cd rwg
    $ ls
    184997 csjncqmr
    4378 dcgph
    55767 qnc.wvv
    $ cd ..
    $ cd ..
    $ cd sbbzgbz
    $ ls
    321376 csjncqmr
    317438 flp
    9263 hrs
    $ cd ..
    $ cd wnsnssbg
    $ ls
    dir jdjv
    $ cd jdjv
    $ ls
    153354 gzjdsn.wlc
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd rcgmhz
    $ ls
    dir tjhzggs
    $ cd tjhzggs
    $ ls
    299192 jfbzjz.ttg
    $ cd ..
    $ cd ..
    $ cd snwrlr
    $ ls
    30314 csjncqmr.jvn
    dir hcf
    $ cd hcf
    $ ls
    81979 jfbzjz.pfz
    179459 ngh
    $ cd ..
    $ cd ..
    $ cd vgj
    $ ls
    278579 jbn.rgz
    dir jzj
    dir lnbhh
    dir pgmgbfcl
    dir qgvspcpm
    $ cd jzj
    $ ls
    295808 hrs
    220437 vqbcl
    $ cd ..
    $ cd lnbhh
    $ ls
    212203 nfmhd.hbq
    233853 qgz.mcd
    $ cd ..
    $ cd pgmgbfcl
    $ ls
    dir mmbdpj
    138462 mwcdrpm.spr
    288430 pgmgbfcl.pwd
    132880 rdmwtn.qjj
    41775 rfqb.djh
    dir rnd
    69597 thnbf
    $ cd mmbdpj
    $ ls
    158542 hrs
    306559 tjhzggs
    $ cd ..
    $ cd rnd
    $ ls
    223745 fnfjhvsp.hgt
    138236 gdmtnffs.cdm
    dir gmzb
    dir hvl
    266178 mzwmjl.rqq
    dir njpq
    33906 qbfhj.tmn
    dir tjhzggs
    $ cd gmzb
    $ ls
    186579 nsbfn.lsd
    $ cd ..
    $ cd hvl
    $ ls
    312925 csjncqmr.sbc
    75264 gqp
    81003 gzjdsn.wlc
    $ cd ..
    $ cd njpq
    $ ls
    188139 lbnrr.pwd
    213545 qgqddvwf.hfl
    $ cd ..
    $ cd tjhzggs
    $ ls
    dir dlwvc
    191782 jfbzjz
    dir tbldpln
    $ cd dlwvc
    $ ls
    75927 jvhjtnft
    260563 qbfhj.tmn
    dir vlg
    $ cd vlg
    $ ls
    187660 hgm
    dir rhr
    273019 tdgr.crr
    $ cd rhr
    $ ls
    286129 wnn.jgn
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd tbldpln
    $ ls
    173546 pdfrsq.pnb
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd qgvspcpm
    $ ls
    dir dhrbsl
    286566 fldhvbq
    209725 gzjdsn.wlc
    148148 nspz.gwc
    111003 tjhzggs
    $ cd dhrbsl
    $ ls
    58390 gzjdsn.wlc
    150545 hrs
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd znbzt
    $ ls
    211651 gwhb.mfz
    $ cd ..
    $ cd ..
    $ cd tjhzggs
    $ ls
    dir hgr
    229076 jfbzjz.dfh
    dir ptfcbwwv
    51893 qbfhj.tmn
    97712 qgtvfh.hvs
    $ cd hgr
    $ ls
    dir hwvgjdq
    dir vwvbt
    $ cd hwvgjdq
    $ ls
    dir pgmgbfcl
    $ cd pgmgbfcl
    $ ls
    dir qgs
    $ cd qgs
    $ ls
    188108 hrs
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd vwvbt
    $ ls
    169212 tfrm.gjb
    $ cd ..
    $ cd ..
    $ cd ptfcbwwv
    $ ls
    67829 lpszzl
    $ cd ..
    $ cd ..
    $ cd wfl
    $ ls
    dir hfcm
    $ cd hfcm
    $ ls
    73872 flp
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd qcf
    $ ls
    dir ctjw
    177175 dwzmnpr
    dir fqldn
    dir hmjnnjjj
    301788 hrs
    dir lgmld
    dir pgmgbfcl
    76771 qzsbm.zdb
    dir scbgn
    234764 vhrlgcf
    $ cd ctjw
    $ ls
    139505 mflt.hnr
    $ cd ..
    $ cd fqldn
    $ ls
    dir bgq
    7260 flgrh.tmt
    dir fnfjhvsp
    dir fnr
    dir gsnqjmw
    10529 gzjdsn.wlc
    22877 hrs
    dir hzbrgrfq
    dir snmbwrzn
    dir tjhzggs
    6773 tzhsjsc
    $ cd bgq
    $ ls
    40780 gzjdsn.wlc
    233301 mnzdbpc
    dir mpdjgbgf
    303076 qbfhj.tmn
    dir qjs
    189723 sbzn.dtj
    dir vhnqcrd
    $ cd mpdjgbgf
    $ ls
    227105 dcgph
    298219 dprcwts.vdt
    $ cd ..
    $ cd qjs
    $ ls
    214072 pgmgbfcl
    264897 qbfhj.tmn
    $ cd ..
    $ cd vhnqcrd
    $ ls
    178950 fnfjhvsp
    180561 pgmgbfcl.mst
    312980 pgmgbfcl.twp
    $ cd ..
    $ cd ..
    $ cd fnfjhvsp
    $ ls
    141191 fnfjhvsp.bng
    81709 pgmgbfcl.sfw
    $ cd ..
    $ cd fnr
    $ ls
    316638 flp
    dir fnfjhvsp
    dir fqdnn
    267054 gdnln
    dir hfcrzwvm
    dir rdljd
    319112 wpcmfbr.zgp
    $ cd fnfjhvsp
    $ ls
    115581 hrs
    dir jfbzjz
    $ cd jfbzjz
    $ ls
    170398 qbfhj.tmn
    $ cd ..
    $ cd ..
    $ cd fqdnn
    $ ls
    dir cfg
    dir jbjltw
    $ cd cfg
    $ ls
    dir qljztr
    dir tnsw
    dir zhnqp
    $ cd qljztr
    $ ls
    64638 bnlsrfb
    63440 csjncqmr
    206111 gzjdsn.wlc
    207890 hrs
    265995 pgmgbfcl.zcw
    $ cd ..
    $ cd tnsw
    $ ls
    85166 lsflqzmc
    $ cd ..
    $ cd zhnqp
    $ ls
    217666 csjncqmr.cch
    $ cd ..
    $ cd ..
    $ cd jbjltw
    $ ls
    88043 dcgph
    238483 hrs
    189734 jnvwjs
    243936 pgmgbfcl.wsr
    $ cd ..
    $ cd ..
    $ cd hfcrzwvm
    $ ls
    dir vwc
    $ cd vwc
    $ ls
    82566 shc.qhj
    $ cd ..
    $ cd ..
    $ cd rdljd
    $ ls
    68011 ptw.bgd
    $ cd ..
    $ cd ..
    $ cd gsnqjmw
    $ ls
    236818 gzjdsn.wlc
    $ cd ..
    $ cd hzbrgrfq
    $ ls
    240924 dcgph
    dir dcjsv
    dir dsrzdjfm
    dir fnfjhvsp
    dir hnzm
    dir mqb
    94014 smpnth.bbm
    $ cd dcjsv
    $ ls
    316708 cmddvb
    dir fnfjhvsp
    $ cd fnfjhvsp
    $ ls
    dir fnfjhvsp
    $ cd fnfjhvsp
    $ ls
    dir jqlcvds
    $ cd jqlcvds
    $ ls
    51018 dqfbq.ggm
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd dsrzdjfm
    $ ls
    262938 csjncqmr.dmm
    125129 mwcnlvhv.szp
    150590 qbfhj.tmn
    dir rrrzpsn
    196430 vbdgb
    dir vsfbwfdl
    $ cd rrrzpsn
    $ ls
    dir tjhzggs
    281655 tjhzggs.btg
    dir tsjzf
    $ cd tjhzggs
    $ ls
    291402 gbl
    dir hctmr
    dir hqdmpwl
    225075 hrs
    dir jfbzjz
    51032 tjhzggs.qzr
    $ cd hctmr
    $ ls
    113430 qbfhj.tmn
    $ cd ..
    $ cd hqdmpwl
    $ ls
    67634 tjhzggs
    $ cd ..
    $ cd jfbzjz
    $ ls
    193552 nmvl.tzj
    197076 pgmgbfcl
    11047 tjhzggs
    $ cd ..
    $ cd ..
    $ cd tsjzf
    $ ls
    36205 jwmdtdjv
    $ cd ..
    $ cd ..
    $ cd vsfbwfdl
    $ ls
    288660 flp
    185921 jfbzjz
    dir mqmvtddt
    124423 nfbfq.dln
    dir wzbc
    $ cd mqmvtddt
    $ ls
    85529 bhjp.vvj
    $ cd ..
    $ cd wzbc
    $ ls
    77316 flp
    271730 pgmgbfcl.lcd
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd fnfjhvsp
    $ ls
    47666 mpwtvwd.fwr
    $ cd ..
    $ cd hnzm
    $ ls
    157672 flp
    294957 gzjdsn.wlc
    297187 lbssg
    24223 qbfhj.tmn
    dir rdnqrgt
    177449 tld.tsd
    $ cd rdnqrgt
    $ ls
    dir nltjzrrr
    217347 vrb.gcd
    $ cd nltjzrrr
    $ ls
    dir zzd
    $ cd zzd
    $ ls
    47464 flp
    dir fnfjhvsp
    $ cd fnfjhvsp
    $ ls
    89424 qtzfddz.btd
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd mqb
    $ ls
    105537 tjhzggs.wns
    $ cd ..
    $ cd ..
    $ cd snmbwrzn
    $ ls
    dir mqt
    dir nsdrn
    dir rjn
    $ cd mqt
    $ ls
    233842 pgmgbfcl
    $ cd ..
    $ cd nsdrn
    $ ls
    67018 dcgph
    17296 flp
    274166 gzjdsn.wlc
    186308 jfbzjz
    280195 lvbsrvwm.zlq
    dir pjv
    dir thlp
    $ cd pjv
    $ ls
    123190 rfbj.gmq
    $ cd ..
    $ cd thlp
    $ ls
    141308 flp
    188164 jfbzjz
    299013 pgmgbfcl
    171259 qbfhj.tmn
    dir qsljb
    $ cd qsljb
    $ ls
    291980 glcnlj.swh
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd rjn
    $ ls
    181047 fqmhpg.hpl
    $ cd ..
    $ cd ..
    $ cd tjhzggs
    $ ls
    dir csjncqmr
    274202 fhfjvdjc.swt
    dir fnfjhvsp
    97050 frbpp.wch
    dir gnbtgdr
    dir jfbzjz
    dir lpg
    dir pgmgbfcl
    dir twcdfdcv
    dir wzd
    dir zllcflrn
    $ cd csjncqmr
    $ ls
    dir chpmwsfj
    dir csjncqmr
    57088 fnfjhvsp.jqg
    52097 vgcm.dpv
    $ cd chpmwsfj
    $ ls
    279480 tjhzggs.srw
    $ cd ..
    $ cd csjncqmr
    $ ls
    13716 dcgph
    dir fqb
    dir jfbzjz
    dir msvlnt
    88312 pgmgbfcl.qcf
    $ cd fqb
    $ ls
    dir mmjfbvq
    $ cd mmjfbvq
    $ ls
    79822 flp
    $ cd ..
    $ cd ..
    $ cd jfbzjz
    $ ls
    302531 csjncqmr
    164326 dcgph
    8277 fnfjhvsp.rbv
    dir jgsrgrtc
    dir zwdgcd
    $ cd jgsrgrtc
    $ ls
    60317 gzjdsn.wlc
    $ cd ..
    $ cd zwdgcd
    $ ls
    171967 fpls.fvd
    $ cd ..
    $ cd ..
    $ cd msvlnt
    $ ls
    83178 cnhzh
    11226 tjhzggs
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd fnfjhvsp
    $ ls
    89882 dcgph
    212817 qbfhj.tmn
    257899 tjhzggs
    $ cd ..
    $ cd gnbtgdr
    $ ls
    dir flltghn
    dir fnfjhvsp
    dir jfbzjz
    300698 ngcsnwb
    292809 qtcqhdq
    dir vbwjgf
    280270 wbzcr.sgn
    $ cd flltghn
    $ ls
    111452 rhgfv
    $ cd ..
    $ cd fnfjhvsp
    $ ls
    dir lbznfb
    31273 nrtrqqc.cth
    $ cd lbznfb
    $ ls
    175736 ljpr.cwm
    $ cd ..
    $ cd ..
    $ cd jfbzjz
    $ ls
    237625 tjhzggs
    $ cd ..
    $ cd vbwjgf
    $ ls
    269242 jrrw.ljb
    106705 pqnbrbt
    $ cd ..
    $ cd ..
    $ cd jfbzjz
    $ ls
    dir dnn
    $ cd dnn
    $ ls
    19045 dcgph
    187257 tjhzggs.qzg
    $ cd ..
    $ cd ..
    $ cd lpg
    $ ls
    101509 fnfjhvsp.nnt
    221211 ldgjngjq
    $ cd ..
    $ cd pgmgbfcl
    $ ls
    dir bzbdphz
    37920 flp
    dir wpsm
    $ cd bzbdphz
    $ ls
    252099 ffsfqfdw
    312106 htft
    298880 jfbvz.znw
    135204 lrwccthr
    dir zhbqf
    108144 zsbbfhz.drr
    $ cd zhbqf
    $ ls
    dir gtw
    298022 svpgsrgj.ljz
    $ cd gtw
    $ ls
    dir csjncqmr
    dir rpzjg
    $ cd csjncqmr
    $ ls
    278962 flp
    272127 tjhzggs
    $ cd ..
    $ cd rpzjg
    $ ls
    92241 flp
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd wpsm
    $ ls
    15936 flp
    241514 qbfhj.tmn
    245049 rjgwzlq.qrw
    $ cd ..
    $ cd ..
    $ cd twcdfdcv
    $ ls
    140758 bjm
    78772 dcgph
    114059 mqsgrc.qcb
    $ cd ..
    $ cd wzd
    $ ls
    dir fnfjhvsp
    dir mcbnp
    $ cd fnfjhvsp
    $ ls
    72702 csjncqmr.jfn
    120586 dcgph
    $ cd ..
    $ cd mcbnp
    $ ls
    12494 fnfjhvsp.frc
    182092 gsv
    17859 pdbvmblc.vng
    116984 pfbdf
    113843 prshrmg.srm
    $ cd ..
    $ cd ..
    $ cd zllcflrn
    $ ls
    30966 flp
    245820 jfbzjz.rnd
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd hmjnnjjj
    $ ls
    134366 dcgph
    212399 dtsb
    255795 zhbcjtr
    $ cd ..
    $ cd lgmld
    $ ls
    55248 pgmgbfcl
    62265 pgmgbfcl.nbg
    240733 zhmff
    $ cd ..
    $ cd pgmgbfcl
    $ ls
    232717 fnfjhvsp
    219581 gtcjbwpz.lmz
    47399 gzjdsn.wlc
    22814 hjqf
    296672 hrs
    dir nrzf
    dir wqgcmnpp
    dir wwvmdjz
    dir zlhv
    $ cd nrzf
    $ ls
    18406 dcgph
    dir mhm
    $ cd mhm
    $ ls
    95168 pgmgbfcl.hqv
    $ cd ..
    $ cd ..
    $ cd wqgcmnpp
    $ ls
    dir csjncqmr
    189963 dvcd.tnh
    dir gzqrt
    dir njffft
    dir qvqp
    6981 tjhzggs
    dir wgfnlfsd
    $ cd csjncqmr
    $ ls
    307371 cdptrw.rfm
    $ cd ..
    $ cd gzqrt
    $ ls
    dir pwsqss
    $ cd pwsqss
    $ ls
    173397 flp
    $ cd ..
    $ cd ..
    $ cd njffft
    $ ls
    dir bzhzg
    dir tjhzggs
    $ cd bzhzg
    $ ls
    213821 pgmgbfcl
    $ cd ..
    $ cd tjhzggs
    $ ls
    dir szvfzgj
    $ cd szvfzgj
    $ ls
    196306 tjhzggs.hjh
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd qvqp
    $ ls
    dir pgmgbfcl
    $ cd pgmgbfcl
    $ ls
    114456 flp
    252954 pgmgbfcl
    $ cd ..
    $ cd ..
    $ cd wgfnlfsd
    $ ls
    212011 gzjdsn.wlc
    $ cd ..
    $ cd ..
    $ cd wwvmdjz
    $ ls
    70022 dcgph
    dir hjgvstp
    dir jhgb
    276853 qbfhj.tmn
    242756 qdqswjjd.wnn
    dir tjhzggs
    292963 wcgmgmz.shb
    $ cd hjgvstp
    $ ls
    24056 tdjwdw
    $ cd ..
    $ cd jhgb
    $ ls
    90571 gzjdsn.wlc
    132326 rrvfml.dms
    $ cd ..
    $ cd tjhzggs
    $ ls
    29139 dmrsz.qhc
    $ cd ..
    $ cd ..
    $ cd zlhv
    $ ls
    315120 dcgph
    290175 pgvlcvpb
    $ cd ..
    $ cd ..
    $ cd scbgn
    $ ls
    258300 bcchv.qsn
    $ cd ..
    $ cd ..
    $ cd wrsjr
    $ ls
    dir csjncqmr
    dir jfbzjz
    dir nmfmqb
    dir svgtrz
    dir zjvhmd
    $ cd csjncqmr
    $ ls
    148619 qbfhj.tmn
    $ cd ..
    $ cd jfbzjz
    $ ls
    dir csjncqmr
    dir flrhpzt
    dir fnfjhvsp
    dir gpwv
    dir lwrtc
    $ cd csjncqmr
    $ ls
    dir czmlfmf
    137365 flp
    dir hggbs
    107369 mpgm.lbl
    $ cd czmlfmf
    $ ls
    dir hnpjvq
    $ cd hnpjvq
    $ ls
    41339 fnfjhvsp.wnv
    $ cd ..
    $ cd ..
    $ cd hggbs
    $ ls
    273367 qbfhj.tmn
    $ cd ..
    $ cd ..
    $ cd flrhpzt
    $ ls
    200923 fwb
    62059 hrs
    $ cd ..
    $ cd fnfjhvsp
    $ ls
    dir gdnmpgn
    256037 hrs
    $ cd gdnmpgn
    $ ls
    64024 jmww.gbb
    $ cd ..
    $ cd ..
    $ cd gpwv
    $ ls
    159155 hrs
    $ cd ..
    $ cd lwrtc
    $ ls
    150299 nzvqj.dsv
    129702 pgmgbfcl.lrt
    dir zvgb
    $ cd zvgb
    $ ls
    304137 hrs
    $ cd ..
    $ cd ..
    $ cd ..
    $ cd nmfmqb
    $ ls
    139823 jfbzjz
    299946 nqqscdn.wsw
    $ cd ..
    $ cd svgtrz
    $ ls
    dir jdlvtm
    123801 phhrgrbs
    $ cd jdlvtm
    $ ls
    267972 tbgcnf.pqz
    $ cd ..
    $ cd ..
    $ cd zjvhmd
    $ ls
    287427 csjncqmr.tfj
    297578 hhhp.jvt
  }

  test "find_file_size/2" do
    assert Day07.sum_file_size(@input, 100_000) == 1_723_892
  end
end
