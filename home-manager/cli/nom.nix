{ pkgs, lib, inputs, overlays, ... }:
let
  nomConfig = ''
autoread: true

feeds:
  - url: https://9to5linux.com/feed
    name: 9to5Linux
  - url: https://dustri.org/b/rss.xml
    name: Artificial truth
  - url: https://anarc.at/blog/index.rss
    name: Blog.
  - url: https://boilingsteam.com/feed/
    name: Boiling Steam
  - url: https://brave.com/blog/index.xml
    name: Brave's latest news on Brave
  - url: https://brr.fyi/feed.xml
    name: brr
  - url: https://bower.sh/rss
    name: erock's blog
  - url: https://fedoramagazine.org/feed/
    name: Fedora Magazine
  - url: https://www.gamingonlinux.com/article_rss.php
    name: GamingOnLinux Latest Articles
  - url: https://gilest.org/feed/index.xml
    name: gilest.org
  - url: https://itsfoss.com/rss/
    name: It's FOSS
  - url: https://jamesgreenblue.com/index.xml
    name: James Greenhalgh on digital strategy, marine conservation and adventures
  - url: https://jaxson.neocities.org/feed.xml
    name: jaxson's blog
  - url: https://joelchrono12.xyz/feed.xml
    name: Joelchrono12
  - url: https://www.karl.berlin/atom.xml
    name: Karl Bartel's Website
  - url: https://kevquirk.com/feed
    name: Kev Quirk
  - url: https://linuxiac.com/feed/
    name: Linuxiac
  - url: https://www.linuxuprising.com/feeds/posts/default?alt=rss
    name: Linux Uprising Blog
  - url: https://blog.setale.me/index.xml
    name: Lorenzo Setale's Blog
  - url: https://lukesmith.xyz/index.xml
    name: Luke's Webpage
  - url: https://www.cyberciti.com/atom/atom.xml
    name: nixCraft
  - url: https://blog.ononoki.org/atom.xml
    name: ononoki's Blog
  - url: https://oomfie.town/atom.xml
    name: oomfie
  - url: https://pdp.dev/index.xml
    name: Phil Piwonka
  - url: https://www.phoronix.com/rss.php
    name: Phoronix
  - url: https://blog.cschad.com/posts/index.xml
    name: Posts on The CS-Chad Blog
  - url: https://pwning.systems/index.xml
    name: pwning.systems
  - url: https://blogs.gnome.org/alatiera/feed/
    name: Rust in Peace
  - url: https://sheepdev.xyz/index.xml
    name: sheep's website
  - url: https://rss.slashdot.org/Slashdot/slashdotMain
    name: Slashdot
  - url: https://thelinuxexp.com/feed.xml
    name: The Linux Experiment
  - url: https://blog.mozilla.org/en/feed/
    name: The Mozilla Blog
  - url: https://thinkloveshare.com/index.xml
    name: ThinkLoveShare
  - url: https://blog.bfloeser.de/index.xml
    name: This is my blog now
  - url: https://thisweek.gnome.org/index.xml
    name: This Week in GNOME
  - url: https://blog.trieoflogs.com/index.xml
    name: Trie of Logs
  - url: https://www.uninformativ.de/blog/feeds/en.atom
    name: uninformativ.de (en)
  - url: https://unixsheikh.com/feed.rss
    name: unixsheikh.com
  - url: https://hya.sk/atom.xml
    name: Unmaintained space
  - url: https://groundzeno.net/feed.xml
    name: Zenos Homepage
  - url: http://feeds.feedburner.com/HaveIBeenPwnedLatestBreaches
    name: Have I Been Pwned latest breaches
  - url: https://steamcommunity.com/groups/freegamesfinders/rss/
    name: Free Games Finders RSS Feed
  - url: https://privsec.dev/posts/android/index.xml
    name: Android on PrivSec - A practical approach to Privacy and Security
  - url: https://blog.hboeck.de/feeds/index.rss2
    name: Hanno's blog
  - url: https://privsec.dev/posts/knowledge/index.xml
    name: Knowledge Base on PrivSec - A practical approach to Privacy and Security
  - url: https://privsec.dev/posts/linux/index.xml
    name: Linux on PrivSec - A practical approach to Privacy and Security
  - url: https://seirdy.one/posts/atom.xml
    name: Posts on Seirdy's Home
  - url: https://signal.org/blog/rss.xml
    name: Signal Blog
  - url: https://dataswamp.org/~solene/rss.xml
    name: Solene'%
  - url: https://wonderfall.dev/index.xml
    name: Wonder's Lab
  - url: https://memorycache.ai/feed.xml
    name: MemoryCache
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCNaPQ5uLX5iIEHUCLmfAgKg
    name: KidsCanCode
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCIssvKdT9kop4P1KZ_tmVhw
    name: Linux Propaganda
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCTvH45HvnOzqXvfNJqdc3xg
    name: mossbag
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCSuHzQ3GrHSzoBbwrIq3LLA
    name: Naomi Brockwell: NBTV
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCD7K_FECPHTF0z5okAVlh0g
    name: NekotoArts
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCscoqrVcMbZwv5jIpKVYpDg
    name: Ombarus
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCd4t3EEUy0LUOM4MTdjpNHA
    name: The Style Theorists
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC5pD2Tg5p56y5Z0mGjHTwkQ
    name: Crystal Development
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCZ_cuJGBis0vi6U3bWmvDIg
    name: FaceDev
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UChmxBR8y5U6y7doI7NhN84Q
    name: Ghiafreak
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCE4Xm42BI5LJjWde0hsoQhw
    name: GrizzlyMoose
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCraJA_8POJoDXuutAVUeX3A
    name: Myx0
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCzLjjRlkOosxt0eQamPyhlA
    name: Nephitejnf
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCxAA8ZpfEk8UsUEH9SQlOrg
    name: Point Kid
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCoeUvZfZu-qn7dfrwD4NCtw
    name: Steven Gong
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCcaqDKIaqXNh0x0Sanj_yDA
    name: T3rr0r
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCFi0LVUvZG8V9g7npfMGaaw
    name: The CS Guy
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCm6BYVYZjNskghQV2qDRuOQ
    name: Asatiir's Tales
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCqxyaqSmvAwZcgiDIplg_Jw
    name: Blid
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCF9oIW4anDbuHK2eUqabeKw
    name: Creauctopus
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCaPGKhms7rUVjpBceeJUdUQ
    name: Diamondbolt
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC9DR22-qohBDtZ74R3FxOZg
    name: Emi
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCGo22VEt5enuQHeQTXcPuzw
    name: Exploring the Simulation
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCqpWX1aVv2Nnsp8sxuLUIFg
    name: Gabe Follower • EN
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCJZtxZyMmB0E919ZhkAKW8A
    name: HintShot
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCmFeOdJI3IXgTBDzqBLD8qg
    name: https://www.youtube.com/@Moon-Real
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCXUI82K1Hg4xYUZ88ULoDZw
    name: JamesBunny
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHyMNXj5l7eTTQefXzT3MdQ
    name: Joe Caine
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCsnEJAjrwfuU7T2yYv00WsA
    name: Kevduit
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCSZXFhRIx6b0dFX3xS8L1yQ
    name: Kevin MacLeod
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC7Qsqrf__HlHaOewtSyc_IQ
    name: Kextex
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC7KMFrYHQzmXCbomARoP9zg
    name: Ludo1337
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC5m8YYgwmpRsqm-PJ-eInIA
    name: Matt Yuan
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCaoqVlqPTH78_xjTjTOMcmQ
    name: Miziziziz
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UChFur_NwVSbUozOcF_F2kMg
    name: Mumbo Jumbo
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCCEr_zQF-go-ZtMCwyv1uPg
    name: My Linux Diary
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMvETSFFkMOADyrGBj3gbWA
    name: NerdOut!
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC19xLluI7dG093Gmw57BhHw
    name: NFKRZ
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCqMq30uY_qtG9mbj5ZdcTTA
    name: peppidesu
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCbpe1SYzZKG4RswEnxxSRZQ
    name: Root BSD
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCmtyQOKKmrMVaKuRXz02jbQ
    name: Sebastian Lague
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC-NUlZIZprk8tVtJJaJ-2_A
    name: 3DprintedLife
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC-lr0YDsyRL8URzQzg9hFlQ
    name: Adam on Linux
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCwytZrjtI5oMHXFQM71xnRw
    name: AugustTheDuck
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC9H0HzpKf5JlazkADWnW1Jw
    name: bashbunni
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCrbLJYzJjDf2p-vJC011lYw
    name: Bastiaan Olij
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC2Xd-TjJByJyK2w1zNwY0zQ
    name: Beyond Fireship
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMlesgrkPgg22TRfCj_m_Pg
    name: BigToe
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMziDXhuy5QeHL1Op1fDoEg
    name: Captain Indecision
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCiSIL42pQRpc-8JNiYDFyzQ
    name: chris biscardi
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCznj32AM2r98hZfTxrRo9bQ
    name: Clear Code
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCRLHJ-7b4pjDpBBHAUXEvjQ
    name: conaticus
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCmVOOoKpg3oUK_-PH3UXaSg
    name: Crealick
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMqXCTXulFWHrmd2588IqJw
    name: crow
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC1rf511TyJlFICTvOZhHo1w
    name: CS Ghost Animation
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHt8ZrDqU6C28CBTaoCcYNA
    name: C-STATE
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCNzszbnvQeFzObW0ghk0Ckw
    name: Dave's Garage
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCP7WmQ_U4GB3K51Od9QvM0w
    name: David Bombal
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCIM48Tn2G5t5KKZgwGu9lcw
    name: Death Caller
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMr1lqB1oN3-cYf6cj6-v-A
    name: Degenerocity
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHF0LnznV3h05fkHVEq3MaA
    name: DevBanana
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCFU7a7OMYfcpjtIpu2j47_Q
    name: DevOnDuty
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCrLSRJhOz8rBvgQqvOQlRUA
    name: Dicode
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCVuyByFo6js2qeEIJQEzJfg
    name: elmaxo
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA
    name: Fireship
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCab_g85VwjPvdXdBoc8ETkA
    name: FranklyGaming
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCCE5NVlm0FhbunMMBT48WAw
    name: Fundy
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCLweX1UtQjRjj7rs_0XQ2Eg
    name: Game Endeavor
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCqJ-Xo29CKyLTjn6z2XwYAw
    name: Game Maker's Toolkit
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCgXsdMIu8xq7U2fKgMZluXA
    name: GB_2
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCxdZ7XCQVMRMipj3gGemQfw
    name: GNULectures
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCG2IoSJBUhrGL8fb5stMCWw
    name: Gonkee
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCFC9LamNMmLioW643VZ40OA
    name: gotyemusic
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC1Re_uqvG9TG_5t0Z4TM2Bw
    name: Gratz
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCCMi6F5Ac3kQDfffWXQGZDw
    name: Guided Hacking
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC3s0BtrBJpwNDaflRSoiieQ
    name: Hak5
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCgdTVe88YVSrOZ9qKumhULQ
    name: Hardware Haven
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCrHQNOyU1q6BFEfkNq2CYMA
    name: HeartBeast
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCWWOwMI0EI7n2AfVu_n4cHg
    name: Hohol
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC56sEY3hhz8t7C9JhnWyc6A
    name: Hunter
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCJLZe_NoiG0hT7QCX_9vmqw
    name: I did a thing
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCTjnCCcuIbrprhOiaDJxxHA
    name: Infallible Code
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC04N-5DxEWH4ioK0bvZmF_Q
    name: Innes Anderson-Morrison
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC2avWDLN1EI3r1RZ_dlSxCw
    name: Integza
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC5mIA5Y5_oARjxK8DCT-Cww
    name: Isaac Harris-Holt
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCZSMmqCRsi8FW_xmNZl11Fg
    name: Jax
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCUzQJ3JBuQ9w-po4TXRJHiA
    name: jdh
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCSC6F-cM6_Xm3aJnHs6ZDVA
    name: Joeseppi
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCSp-OaMpsO8K0KkOqyBl7_w
    name: Let's Get Rusty
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UClvemPJ-iy5a1iA7xxnVGBA
    name: Liachu
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCfKUfrMPuYNyysWDHnlBBSg
    name: Little french robot
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCg-RkUY5LWy9qL1RBt2y0oA
    name: Lost Relic Games
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg
    name: Low Level Learning
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCpXFH5PUUUc6lHpxJfaFctA
    name: LuckyBlackCat
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA
    name: Luke Smith
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHfMtezK744dwysrGfeoA2g
    name: Matchday Soccer
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA
    name: Mental Outlaw
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHS55yDvORmCpbM_3vNQQsQ
    name: Michael Rechtin
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC6jdQrif2CvUqH6llkzB0dA
    name: MoDen31
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCKaYxkHrmsQePZFpzF9b7sQ
    name: Mr. P Solver
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCNzX63sWlLoKHT7SE8iyFTA
    name: Nagi
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCPe7XrmOPtz4OjL6KGtvJMA
    name: Nicholas Rehm
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA
    name: No Boilerplate
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCrnJ79lUp5tk6alqbAFcvMw
    name: OrangE
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCRKQt02Cdx9hAOpmomdjgQw
    name: OrelStealth
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC2PZst8gwmorXjwDIZdYQcg
    name: PanLuvme
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC8RBLJdSpxSVWDc_bGKmdQQ
    name: Piemations
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCrauJytoFDMZ1wJc7eK0c1g
    name: Poinball
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCORaUhZVpg7yhxJeaPSTGmQ
    name: Pontypants
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCUoh9nm29EyKdiro5tAd4Ig
    name: PracticalNPC
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCl-1F7xXsemsq-dAYODVt8g
    name: Privacy Tips Naomi
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC9evhW4JB_UdXSLeZGy8lGw
    name: Raid Owl
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCfHmyqCntYHQ81ZukNu66rg
    name: Razbuten
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCq2rNse2XX4Rjzmldv9GqrQ
    name: rctestflight
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCORkUj9eaM2aDJM1VYyDDTA
    name: Sam Hogan
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC3j2KPMDe50SgrHdbtgDw7A
    name: Self-Made Weapons
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCfzlCWGWYyIQ0aLC5w48gBQ
    name: sentdex
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCW6xlqxSY3gGur4PkGPEUeA
    name: Seytonic
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCAWe-0Z2FZUBaoaTOXitHyQ
    name: Spiderbait 25
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC3S8vxwRfqLBdIhgRlDRVzw
    name: stacksmashing
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCJYJgj7rzsn0vdR7fkgjuIA
    name: styropyro
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCVraU9wuIQr8H1B0kcUD7Tw
    name: Sumsub
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCoSjFBswqHEtFCZG9tPZOYQ
    name: TeamSlav
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCAYxyISV_P36x5Ymv_CKSFw
    name: Tech Tyrial
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC4JX40jDee_tINbkjycV4Sg
    name: Tech With Tim
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC3sznuotAs2ohg_U__Jzj_Q
    name: The Film Theorists
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCZ4FCMrIn08I7-QipOcJcEA
    name: The Flying Tea Cup
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHYoe8kQ-7Gn9ASOlmI0k6Q
    name: The Food Theorists
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCylGUf9BvQooEFjgdNudoQg
    name: The Linux Cast
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw
    name: The Linux Experiment
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCjCvsBFcJFgak0ZBT1Sz0HA
    name: The Project Box
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC8-P6Y-NKvARUeyQPsfXmKg
    name: TheSTEMGamer
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC67gfx2Fg7K2NSHqoENVgwA
    name: Tom Stanton
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC5U7mHlhP6s6478wd7ZvnhA
    name: Trafotin
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC0szxwii-u4CZkJIt2iu4_A
    name: Two Star
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCgNTbrlCS9wY6mQM2cbeUpQ
    name: Typhoon
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCJ_CkTKSh4lP106s0xqbzYw
    name: V
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UClqFSFR_H1yJJ7NRs8xxGCQ
    name: Vimlark
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCCFVFyadjMuaR5O89yRToew
    name: Virbox
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCuzs2T4DAbLmwLVyWROvl9A
    name: Wet Socks
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCmw-QGOHbHA5cDAvwwqUTKQ
    name: Zaney
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCosnWgi3eorc1klEQ8pIgJQ
    name: Afrotechmods
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCVS89U86PwqzNkK2qYNbk5A
    name: Allen Pan
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCO5QSoES5yn2Dw7YixDYT5Q
    name: Aperture
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC9Z1XWw1kmnvOOFsj6Bzy2g
    name: Blackthornprod
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCymgNglZHYlS1Aw8Mu3QqaA
    name: Craylor Made
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCTbvANBxk5YcCsjKK4IIt8A
    name: diego ammirabile
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg
    name: DistroTube
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC1UbX6IQrZfL42v1YqN_qsw
    name: Doktor Skipper
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCLhoj8ijqBVymbVD48hhQIQ
    name: Dumbsville
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCpJeawG3vkh_sRS5AJbObyg
    name: Eliott
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCWEVAMMyXF2NP5txDESGemg
    name: Fat Dino
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCxboW7x0jZqFdvMdCFKTMsQ
    name: GDQuest
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC6mIxFTvXkWQVEHPsEdflzQ
    name: GreatScott!
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC_iUeUzozCHEReJ-shKcCYA
    name: Internet Anarchist
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCR-DXc1voovS8nhAvccRZhg
    name: Jeff Geerling
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCto7D1L-MiRoOziCXK9uT5Q
    name: Let's Game It Out
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw
    name: Linus Tech Tips
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UClcE-kVhqyiHCcjYwcpfj9w
    name: LiveOverflow
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCFtc3XdXgLFwhlDajMGK69w
    name: NightHawkInLight
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCsdl6e9v1SoMuXg1u80gPtA
    name: P-Bean
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCp2P7og4fgUyRAzMbpvaFyg
    name: Peter J.
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCt2z9lQN3jTztbjDHCW8qTg
    name: Purplers
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCTOmfYYAFECBnnkKFgv3meA
    name: Redstuff
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCxrqVfm7FUHSkboVbp1dr7w
    name: Reluctant Anarchist
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCpxkh_1pUnG3Ohgk6oqFyfA
    name: River's Educational Channel
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMV6M_1IE8y8wr6kEF2Dsuw
    name: Sciencish
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCdBK94H6oZT2Q7l0-b0xmMg
    name: ShortCircuit
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC6107grRI4m0o2-emgoDnAA
    name: SmarterEveryDay
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCtMVHI3AJD4Qk4hcbZnI9ZQ
    name: SomeOrdinaryGamers
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC5WhMiIFDcPJdqfPUhXIS-g
    name: Sushanth S
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCStacuNXCCDBwn--dWCilNA
    name: Swirft
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCo_IB5145EVNcf8hw1Kku7w
    name: The Game Theorists
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHsRtomD4twRf5WVHHk-cMw
    name: TierZoo
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA
    name: Veritasium
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ
    name: Veronica Explains
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UC0G7e3uCtTyKQy2vZbRaKxg
    name: Works By Design
  - url: https://www.youtube.com/feeds/videos.xml?channel_id=UCVpankR4HtoAVtYnFDUieYA
    name: Ze Frank
  - url: https://makezine.com/feed/
    name: DIY Projects and Ideas for Makers
  - url: https://thenextweb.com/feed
    name: The Next Web
  - url: https://github.com/FreshRSS/FreshRSS/releases.atom
    name: FreshRSS releases
    '';
in {
  home.file.".config/nom/config.yml".text = nomConfig;
  home.packages = [
    nom
  ];
}
