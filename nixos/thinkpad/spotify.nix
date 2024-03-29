{ config, lib, pkgs, ... }:

{

  # Spotify adblock
  networking.extraHosts = ''
    0.0.0.0 1435575.fls.doubleclick.net
    0.0.0.0 2542116.fls.doubleclick.net
    0.0.0.0 2mdn.net
    0.0.0.0 3642305.fls.doubleclick.net
    0.0.0.0 3765329.fls.doubleclick.net
    0.0.0.0 3ad.doubleclick.net
    0.0.0.0 4.afs.googleadservices.com
    0.0.0.0 4053494.fls.doubleclick.net
    0.0.0.0 4236808.fls.doubleclick.net
    0.0.0.0 4360661.fls.doubleclick.net
    0.0.0.0 4488352.fls.doubleclick.net
    0.0.0.0 4514783.fls.doubleclick.net
    0.0.0.0 4684100.fls.doubleclick.net
    0.0.0.0 5362399.fls.doubleclick.net
    0.0.0.0 ad-ace.doubleclick.net
    0.0.0.0 ad-apac.doubleclick.net
    0.0.0.0 ad-emea.doubleclick.net
    0.0.0.0 ad-g.doubleclick.net
    0.0.0.0 ad-yt-bfp.doubleclick.net
    0.0.0.0 ad.3au.doubleclick.net
    0.0.0.0 ad.ae.doubleclick.net
    0.0.0.0 ad.ar.doubleclick.net
    0.0.0.0 ad.at.doubleclick.net
    0.0.0.0 ad.au.doubleclick.net
    0.0.0.0 ad.be.doubleclick.net
    0.0.0.0 ad.bg.doubleclick.net
    0.0.0.0 ad.br.doubleclick.net
    0.0.0.0 ad.ca.doubleclick.net
    0.0.0.0 ad.ch.doubleclick.net
    0.0.0.0 ad.cl.doubleclick.net
    0.0.0.0 ad.cn.doubleclick.net
    0.0.0.0 ad.de.doubleclick.net
    0.0.0.0 ad.dk.doubleclick.net
    0.0.0.0 ad.doubleclick.net
    0.0.0.0 ad.es.doubleclick.net
    0.0.0.0 ad.fi.doubleclick.net
    0.0.0.0 ad.fr.doubleclick.net
    0.0.0.0 ad.gr.doubleclick.net
    0.0.0.0 ad.hk.doubleclick.net
    0.0.0.0 ad.hr.doubleclick.net
    0.0.0.0 ad.hu.doubleclick.net
    0.0.0.0 ad.ie.doubleclick.net
    0.0.0.0 ad.in.doubleclick.net
    0.0.0.0 ad.it.doubleclick.net
    0.0.0.0 ad.jp.doubleclick.net
    0.0.0.0 ad.kr.doubleclick.net
    0.0.0.0 ad.mo.doubleclick.net
    0.0.0.0 ad.my.doubleclick.net
    0.0.0.0 ad.n2434.doubleclick.net
    0.0.0.0 ad.nl.doubleclick.net
    0.0.0.0 ad.no.doubleclick.net
    0.0.0.0 ad.nz.doubleclick.net
    0.0.0.0 ad.pl.doubleclick.net
    0.0.0.0 ad.pt.doubleclick.net
    0.0.0.0 ad.ro.doubleclick.net
    0.0.0.0 ad.rs.doubleclick.net
    0.0.0.0 ad.ru.doubleclick.net
    0.0.0.0 ad.se.doubleclick.net
    0.0.0.0 ad.sg.doubleclick.net
    0.0.0.0 ad.si.doubleclick.net
    0.0.0.0 ad.terra.doubleclick.net
    0.0.0.0 ad.th.doubleclick.net
    0.0.0.0 ad.tw.doubleclick.net
    0.0.0.0 ad.uk.doubleclick.net
    0.0.0.0 ad.us.doubleclick.net
    0.0.0.0 ad.ve.doubleclick.net
    0.0.0.0 ad.za.doubleclick.net
    0.0.0.0 ad2.doubleclick.net
    0.0.0.0 adclick.g.doublecklick.net
    0.0.0.0 adclick.g.doubleclick.net
    0.0.0.0 adeventtracker.spotify.com
    0.0.0.0 adnxs.com
    0.0.0.0 ads-fa.spotify.com
    0.0.0.0 ads.cc-dt.com
    0.0.0.0 ads.pubmatic.com
    0.0.0.0 ads.yahoo.com
    0.0.0.0 adservices.google.com
    0.0.0.0 adwords.google.lloymlincs.com
    0.0.0.0 affiliate.2mdn.net
    0.0.0.0 affiliate.googleusercontent.com
    0.0.0.0 agkn.com
    0.0.0.0 aktrack.pubmatic.com
    0.0.0.0 amn.doubleclick.net
    0.0.0.0 analytic-google.com
    0.0.0.0 analytics-api-samples.googlecode.com
    0.0.0.0 analytics.google.com
    0.0.0.0 analytics.spotify.com
    0.0.0.0 anon.doubleclick.speedera.net
    0.0.0.0 aud.pubmatic.com
    0.0.0.0 audio-ec.spotify.com
    0.0.0.0 audio-fa.spotify.com
    0.0.0.0 audio-sp-ash.spotify.com
    0.0.0.0 audio-sp-tyo.spotify.com
    0.0.0.0 audio-sp.spotify.com
    0.0.0.0 audio2.spotify.com
    0.0.0.0 b.scorecardresearch.com
    0.0.0.0 bid.g.doubleclick.net
    0.0.0.0 bid.pubmatic.com
    0.0.0.0 bounceexchange.com
    0.0.0.0 bs.serving-sys.com
    0.0.0.0 buttons.googlesyndication.com
    0.0.0.0 cc-dt.com
    0.0.0.0 clickserve.cc-dt.com
    0.0.0.0 clientmetrics-pa.googleapis.com
    0.0.0.0 cloudfront.net
    0.0.0.0 cm.g.doubleclick.net
    0.0.0.0 content.bitsontherun.com
    0.0.0.0 core.insightexpressai.com
    0.0.0.0 crashdump.spotify.com
    0.0.0.0 creative.cc-dt.com
    0.0.0.0 creatives.doubleclick.net
    0.0.0.0 d2gi7ultltnc2u.cloudfront.net
    0.0.0.0 d3rt1990lpmkn.cloudfront.net
    0.0.0.0 desktop.spotify.com
    0.0.0.0 dfp.doubleclick.net
    0.0.0.0 domains.googlesyndication.com
    0.0.0.0 doubleclick.com
    0.0.0.0 doubleclick.de
    0.0.0.0 doubleclick.ne.jp
    0.0.0.0 doubleclick.net
    0.0.0.0 dp.g.doubleclick.net
    0.0.0.0 ds.serving-sys.com
    0.0.0.0 ebaycn.doubleclick.net
    0.0.0.0 ebaytw.doubleclick.net
    0.0.0.0 exnjadgda1.doubleclick.net
    0.0.0.0 exnjadgda2.doubleclick.net
    0.0.0.0 exnjadgds1.doubleclick.net
    0.0.0.0 exnjmdgda1.doubleclick.net
    0.0.0.0 exnjmdgds1.doubleclick.net
    0.0.0.0 fastclick.net
    0.0.0.0 feedads.g.doubleclick.net
    0.0.0.0 feedads.googleadservices.com
    0.0.0.0 fgoogle.com
    0.0.0.0 fls.au.doubleclick.net
    0.0.0.0 fls.doubleclick.net
    0.0.0.0 fls.uk.doubleclick.net
    0.0.0.0 gads.pubmatic.com
    0.0.0.0 gan.doubleclick.net
    0.0.0.0 gcdn.2mdn.net
    0.0.0.0 gd1.doubleclick.net
    0.0.0.0 gd10.doubleclick.net
    0.0.0.0 gd11.doubleclick.net
    0.0.0.0 gd12.doubleclick.net
    0.0.0.0 gd13.doubleclick.net
    0.0.0.0 gd14.doubleclick.net
    0.0.0.0 gd15.doubleclick.net
    0.0.0.0 gd16.doubleclick.net
    0.0.0.0 gd17.doubleclick.net
    0.0.0.0 gd18.doubleclick.net
    0.0.0.0 gd19.doubleclick.net
    0.0.0.0 gd2.doubleclick.net
    0.0.0.0 gd20.doubleclick.net
    0.0.0.0 gd21.doubleclick.net
    0.0.0.0 gd22.doubleclick.net
    0.0.0.0 gd23.doubleclick.net
    0.0.0.0 gd24.doubleclick.net
    0.0.0.0 gd25.doubleclick.net
    0.0.0.0 gd26.doubleclick.net
    0.0.0.0 gd27.doubleclick.net
    0.0.0.0 gd28.doubleclick.net
    0.0.0.0 gd29.doubleclick.net
    0.0.0.0 gd3.doubleclick.net
    0.0.0.0 gd30.doubleclick.net
    0.0.0.0 gd31.doubleclick.net
    0.0.0.0 gd4.doubleclick.net
    0.0.0.0 gd5.doubleclick.net
    0.0.0.0 gd7.doubleclick.net
    0.0.0.0 gd8.doubleclick.net
    0.0.0.0 gd9.doubleclick.net
    0.0.0.0 google-analytics.com
    0.0.0.0 googleads.g.doubleclick.net
    0.0.0.0 googleads2.g.doubleclick.net
    0.0.0.0 googleads4.g.doubleclick.net
    0.0.0.0 googleadservices.com
    0.0.0.0 googlepositions.com
    0.0.0.0 googlesyndication.com
    0.0.0.0 googletagservices.com
    0.0.0.0 gtssl2-ocsp.geotrust.com
    0.0.0.0 gvt1.com
    0.0.0.0 haso.pubmatic.com
    0.0.0.0 heads-fab.spotify.com
    0.0.0.0 image2.pubmatic.com
    0.0.0.0 ir.doubleclick.net
    0.0.0.0 iv.doubleclick.net
    0.0.0.0 js.moatads.com
    0.0.0.0 ln.doubleclick.net
    0.0.0.0 log.spotify.com
    0.0.0.0 m.2mdn.net
    0.0.0.0 m.de.2mdn.net
    0.0.0.0 m.doubleclick.net
    0.0.0.0 m.fr.2mdn.net
    0.0.0.0 m.uk.2mdn.net
    0.0.0.0 m1.2mdn.net
    0.0.0.0 m1.ae.2mdn.net
    0.0.0.0 m1.au.2mdn.net
    0.0.0.0 m1.be.2mdn.net
    0.0.0.0 m1.br.2mdn.net
    0.0.0.0 m1.ca.2mdn.net
    0.0.0.0 m1.cn.2mdn.net
    0.0.0.0 m1.de.2mdn.net
    0.0.0.0 m1.dk.2mdn.net
    0.0.0.0 m1.doubleclick.net
    0.0.0.0 m1.emea.2mdn.net
    0.0.0.0 m1.emea.2mdn.net.edgesuite.net
    0.0.0.0 m1.es.2mdn.net
    0.0.0.0 m1.fi.2mdn.net
    0.0.0.0 m1.fr.2mdn.net
    0.0.0.0 m1.it.2mdn.net
    0.0.0.0 m1.jp.2mdn.net
    0.0.0.0 m1.nl.2mdn.net
    0.0.0.0 m1.no.2mdn.net
    0.0.0.0 m1.nz.2mdn.net
    0.0.0.0 m1.pl.2mdn.net
    0.0.0.0 m1.se.2mdn.net
    0.0.0.0 m1.sg.2mdn.net
    0.0.0.0 m1.uk.2mdn.net
    0.0.0.0 m1.ve.2mdn.net
    0.0.0.0 m1.za.2mdn.net
    0.0.0.0 m2.ae.2mdn.net
    0.0.0.0 m2.au.2mdn.net
    0.0.0.0 m2.be.2mdn.net
    0.0.0.0 m2.br.2mdn.net
    0.0.0.0 m2.ca.2mdn.net
    0.0.0.0 m2.cn.2mdn.net
    0.0.0.0 m2.cn.doubleclick.net
    0.0.0.0 m2.de.2mdn.net
    0.0.0.0 m2.dk.2mdn.net
    0.0.0.0 m2.doubleclick.net
    0.0.0.0 m2.es.2mdn.net
    0.0.0.0 m2.fi.2mdn.net
    0.0.0.0 m2.fr.2mdn.net
    0.0.0.0 m2.it.2mdn.net
    0.0.0.0 m2.jp.2mdn.net
    0.0.0.0 m2.nl.2mdn.net
    0.0.0.0 m2.no.2mdn.net
    0.0.0.0 m2.nz.2mdn.net
    0.0.0.0 m2.pl.2mdn.net
    0.0.0.0 m2.se.2mdn.net
    0.0.0.0 m2.sg.2mdn.net
    0.0.0.0 m2.uk.2mdn.net
    0.0.0.0 m2.ve.2mdn.net
    0.0.0.0 m2.za.2mdn.net
    0.0.0.0 m3.2mdn.net
    0.0.0.0 m3.ae.2mdn.net
    0.0.0.0 m3.au.2mdn.net
    0.0.0.0 m3.be.2mdn.net
    0.0.0.0 m3.br.2mdn.net
    0.0.0.0 m3.ca.2mdn.net
    0.0.0.0 m3.cn.2mdn.net
    0.0.0.0 m3.de.2mdn.net
    0.0.0.0 m3.dk.2mdn.net
    0.0.0.0 m3.doubleclick.net
    0.0.0.0 m3.es.2mdn.net
    0.0.0.0 m3.fi.2mdn.net
    0.0.0.0 m3.fr.2mdn.net
    0.0.0.0 m3.it.2mdn.net
    0.0.0.0 m3.jp.2mdn.net
    0.0.0.0 m3.nl.2mdn.net
    0.0.0.0 m3.no.2mdn.net
    0.0.0.0 m3.nz.2mdn.net
    0.0.0.0 m3.pl.2mdn.net
    0.0.0.0 m3.se.2mdn.net
    0.0.0.0 m3.sg.2mdn.net
    0.0.0.0 m3.uk.2mdn.net
    0.0.0.0 m3.ve.2mdn.net
    0.0.0.0 m3.za.2mdn.net
    0.0.0.0 m4.ae.2mdn.net
    0.0.0.0 m4.afs.googleadservices.com
    0.0.0.0 m4.au.2mdn.net
    0.0.0.0 m4.be.2mdn.net
    0.0.0.0 m4.br.2mdn.net
    0.0.0.0 m4.ca.2mdn.net
    0.0.0.0 m4.cn.2mdn.net
    0.0.0.0 m4.de.2mdn.net
    0.0.0.0 m4.dk.2mdn.net
    0.0.0.0 m4.doubleclick.net
    0.0.0.0 m4.es.2mdn.net
    0.0.0.0 m4.fi.2mdn.net
    0.0.0.0 m4.fr.2mdn.net
    0.0.0.0 m4.it.2mdn.net
    0.0.0.0 m4.jp.2mdn.net
    0.0.0.0 m4.nl.2mdn.net
    0.0.0.0 m4.no.2mdn.net
    0.0.0.0 m4.nz.2mdn.net
    0.0.0.0 m4.pl.2mdn.net
    0.0.0.0 m4.se.2mdn.net
    0.0.0.0 m4.sg.2mdn.net
    0.0.0.0 m4.uk.2mdn.net
    0.0.0.0 m4.ve.2mdn.net
    0.0.0.0 m4.za.2mdn.net
    0.0.0.0 m5.ae.2mdn.net
    0.0.0.0 m5.au.2mdn.net
    0.0.0.0 m5.be.2mdn.net
    0.0.0.0 m5.br.2mdn.net
    0.0.0.0 m5.ca.2mdn.net
    0.0.0.0 m5.cn.2mdn.net
    0.0.0.0 m5.de.2mdn.net
    0.0.0.0 m5.dk.2mdn.net
    0.0.0.0 m5.doubleclick.net
    0.0.0.0 m5.es.2mdn.net
    0.0.0.0 m5.fi.2mdn.net
    0.0.0.0 m5.fr.2mdn.net
    0.0.0.0 m5.it.2mdn.net
    0.0.0.0 m5.jp.2mdn.net
    0.0.0.0 m5.nl.2mdn.net
    0.0.0.0 m5.no.2mdn.net
    0.0.0.0 m5.nz.2mdn.net
    0.0.0.0 m5.pl.2mdn.net
    0.0.0.0 m5.se.2mdn.net
    0.0.0.0 m5.sg.2mdn.net
    0.0.0.0 m5.uk.2mdn.net
    0.0.0.0 m5.ve.2mdn.net
    0.0.0.0 m5.za.2mdn.net
    0.0.0.0 m6.ae.2mdn.net
    0.0.0.0 m6.au.2mdn.net
    0.0.0.0 m6.be.2mdn.net
    0.0.0.0 m6.br.2mdn.net
    0.0.0.0 m6.ca.2mdn.net
    0.0.0.0 m6.cn.2mdn.net
    0.0.0.0 m6.de.2mdn.net
    0.0.0.0 m6.dk.2mdn.net
    0.0.0.0 m6.doubleclick.net
    0.0.0.0 m6.es.2mdn.net
    0.0.0.0 m6.fi.2mdn.net
    0.0.0.0 m6.fr.2mdn.net
    0.0.0.0 m6.it.2mdn.net
    0.0.0.0 m6.jp.2mdn.net
    0.0.0.0 m6.nl.2mdn.net
    0.0.0.0 m6.no.2mdn.net
    0.0.0.0 m6.nz.2mdn.net
    0.0.0.0 m6.pl.2mdn.net
    0.0.0.0 m6.se.2mdn.net
    0.0.0.0 m6.sg.2mdn.net
    0.0.0.0 m6.uk.2mdn.net
    0.0.0.0 m6.ve.2mdn.net
    0.0.0.0 m6.za.2mdn.net
    0.0.0.0 m7.ae.2mdn.net
    0.0.0.0 m7.au.2mdn.net
    0.0.0.0 m7.be.2mdn.net
    0.0.0.0 m7.br.2mdn.net
    0.0.0.0 m7.ca.2mdn.net
    0.0.0.0 m7.cn.2mdn.net
    0.0.0.0 m7.de.2mdn.net
    0.0.0.0 m7.dk.2mdn.net
    0.0.0.0 m7.doubleclick.net
    0.0.0.0 m7.es.2mdn.net
    0.0.0.0 m7.fi.2mdn.net
    0.0.0.0 m7.fr.2mdn.net
    0.0.0.0 m7.it.2mdn.net
    0.0.0.0 m7.jp.2mdn.net
    0.0.0.0 m7.nl.2mdn.net
    0.0.0.0 m7.no.2mdn.net
    0.0.0.0 m7.nz.2mdn.net
    0.0.0.0 m7.pl.2mdn.net
    0.0.0.0 m7.se.2mdn.net
    0.0.0.0 m7.sg.2mdn.net
    0.0.0.0 m7.uk.2mdn.net
    0.0.0.0 m7.ve.2mdn.net
    0.0.0.0 m7.za.2mdn.net
    0.0.0.0 m8.ae.2mdn.net
    0.0.0.0 m8.au.2mdn.net
    0.0.0.0 m8.be.2mdn.net
    0.0.0.0 m8.br.2mdn.net
    0.0.0.0 m8.ca.2mdn.net
    0.0.0.0 m8.cn.2mdn.net
    0.0.0.0 m8.de.2mdn.net
    0.0.0.0 m8.dk.2mdn.net
    0.0.0.0 m8.doubleclick.net
    0.0.0.0 m8.es.2mdn.net
    0.0.0.0 m8.fi.2mdn.net
    0.0.0.0 m8.fr.2mdn.net
    0.0.0.0 m8.it.2mdn.net
    0.0.0.0 m8.jp.2mdn.net
    0.0.0.0 m8.nl.2mdn.net
    0.0.0.0 m8.no.2mdn.net
    0.0.0.0 m8.nz.2mdn.net
    0.0.0.0 m8.pl.2mdn.net
    0.0.0.0 m8.se.2mdn.net
    0.0.0.0 m8.sg.2mdn.net
    0.0.0.0 m8.uk.2mdn.net
    0.0.0.0 m8.ve.2mdn.net
    0.0.0.0 m8.za.2mdn.net
    0.0.0.0 m9.ae.2mdn.net
    0.0.0.0 m9.au.2mdn.net
    0.0.0.0 m9.be.2mdn.net
    0.0.0.0 m9.br.2mdn.net
    0.0.0.0 m9.ca.2mdn.net
    0.0.0.0 m9.cn.2mdn.net
    0.0.0.0 m9.de.2mdn.net
    0.0.0.0 m9.dk.2mdn.net
    0.0.0.0 m9.doubleclick.net
    0.0.0.0 m9.es.2mdn.net
    0.0.0.0 m9.fi.2mdn.net
    0.0.0.0 m9.fr.2mdn.net
    0.0.0.0 m9.it.2mdn.net
    0.0.0.0 m9.jp.2mdn.net
    0.0.0.0 m9.nl.2mdn.net
    0.0.0.0 m9.no.2mdn.net
    0.0.0.0 m9.nz.2mdn.net
    0.0.0.0 m9.pl.2mdn.net
    0.0.0.0 m9.se.2mdn.net
    0.0.0.0 m9.sg.2mdn.net
    0.0.0.0 m9.uk.2mdn.net
    0.0.0.0 m9.ve.2mdn.net
    0.0.0.0 m9.za.2mdn.net
    0.0.0.0 marketing.doubleclickindustries.com
    0.0.0.0 media-match.com
    0.0.0.0 mimageads.googleadservices.com
    0.0.0.0 mimageads1.googleadservices.com
    0.0.0.0 mimageads2.googleadservices.com
    0.0.0.0 mimageads3.googleadservices.com
    0.0.0.0 mimageads4.googleadservices.com
    0.0.0.0 mimageads5.googleadservices.com
    0.0.0.0 mimageads6.googleadservices.com
    0.0.0.0 mimageads7.googleadservices.com
    0.0.0.0 mimageads8.googleadservices.com
    0.0.0.0 mimageads9.googleadservices.com
    0.0.0.0 motifcdn.doubleclick.net
    0.0.0.0 motifcdn2.doubleclick.net
    0.0.0.0 mpartner.googleadservices.com
    0.0.0.0 n3302ad.doubleclick.net
    0.0.0.0 n3349ad.doubleclick.net
    0.0.0.0 n4052ad.doubleclick.net
    0.0.0.0 n4061ad.doubleclick.net
    0.0.0.0 n4061ad.hk.doubleclick.net
    0.0.0.0 n4403ad.doubleclick.net
    0.0.0.0 n479ad.doubleclick.net
    0.0.0.0 omaze.com
    0.0.0.0 open.spotify.com
    0.0.0.0 optimize.doubleclick.net
    0.0.0.0 pagead-googlehosted.l.google.com
    0.0.0.0 pagead.googlesyndication.com
    0.0.0.0 pagead.l.doubleclick.net
    0.0.0.0 pagead.l.google.com
    0.0.0.0 pagead1.googlesyndication.com
    0.0.0.0 pagead2.googleadservices.com
    0.0.0.0 pagead2.googlesyndication.com
    0.0.0.0 pagead3.googlesyndication.com
    0.0.0.0 pagead46.l.doubleclick.net
    0.0.0.0 partner.googleadservices.com
    0.0.0.0 partnerad.l.doubleclick.net
    0.0.0.0 partnerad.l.google.com
    0.0.0.0 paypalssl.doubleclick.net
    0.0.0.0 pubads.g.doubleclick.net
    0.0.0.0 pubmatic.com
    0.0.0.0 ravenjs.com
    0.0.0.0 rd.intl.doubleclick.net
    0.0.0.0 redirector.gvt1.com
    0.0.0.0 rlcdn.com
    0.0.0.0 rmcdn.2mdn.net
    0.0.0.0 rmcdn.f.2mdn.net
    0.0.0.0 router.googlecom.biz
    0.0.0.0 s0.2mdn.net
    0.0.0.0 s1.2mdn.net
    0.0.0.0 s2.video.doubleclick.net
    0.0.0.0 securepubads.g.doubleclick.net
    0.0.0.0 showads.pubmatic.com
    0.0.0.0 showads1000.pubmatic.com
    0.0.0.0 showadsak.pubmatic.com
    0.0.0.0 so.2mdn.net
    #0.0.0.0 spclient.wg.spotify.com
    0.0.0.0 ssl.google-analytics.com
    0.0.0.0 static.2mdn.net
    0.0.0.0 static.doubleclick.net
    0.0.0.0 stats.g.doubleclick.net
    0.0.0.0 survey.g.doubleclick.net
    0.0.0.0 tpc.googlesyndication.com
    0.0.0.0 track.pubmatic.com
    0.0.0.0 twx.2mdn.net
    0.0.0.0 twx.doubleclick.net
    0.0.0.0 uunyadgda1.doubleclick.net
    0.0.0.0 uunyadgds1.doubleclick.net
    0.0.0.0 v.jwpcdn.com
    0.0.0.0 video-ad-stats.googlesyndication.com
    0.0.0.0 video-stats.video.google.com
    0.0.0.0 weblb-wg.gslb.spotify.com
    0.0.0.0 wintricksbanner.googlepages.com
    0.0.0.0 www-google-analytics.l.google.com
    0.0.0.0 www-google.nl
    0.0.0.0 www.adwords.google.lloymlincs.com
    0.0.0.0 www.analytic-google.com
    0.0.0.0 www.doubleclick.com
    0.0.0.0 www.doubleclick.net
    0.0.0.0 www.doubleclickbygoogle.com
    0.0.0.0 www.google-analytics.com
    0.0.0.0 www.google-docs.info
    0.0.0.0 www.google-docs.org
    0.0.0.0 www.google-tour.com
    0.0.0.0 www.google.ienet.pl
    0.0.0.0 www.google.xweb24.pl
    0.0.0.0 www.googleadservices.com
    0.0.0.0 www.googleapps-espana.com
    0.0.0.0 www.googleapps-jobs.com
    0.0.0.0 www.googleapps-spain.com
    0.0.0.0 www.googlechrome2013.com
    0.0.0.0 www.googletagmanager.com
    0.0.0.0 www.googletagservices.com
    0.0.0.0 www.googlew.com
    0.0.0.0 www.googlewordpad.info
    0.0.0.0 www.partner.googleadservices.com
    0.0.0.0 www.www-google.nl
    0.0.0.0 www.wwwgoogles.com
    0.0.0.0 www2.doubleclick.com
    0.0.0.0 www3.doubleclick.com
    0.0.0.0 www3.doubleclick.net
    0.0.0.0 video-ad-stats.googlesyndication.com
    0.0.0.0 weblb-wg.dual-gslb.spotify.com
    0.0.0.0 weblb-wg.gslb.spotify.com
    0.0.0.0 ds.serving-sys.com
    0.0.0.0 bs.serving-sys.com
  '';

}
