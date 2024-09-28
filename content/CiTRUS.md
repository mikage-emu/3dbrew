+++
title = 'CiTRUS'
categories = ["PC utilities"]
+++

# **IMPORTANT**

The CXI generator has not been released yet, please understand it is
under development. I apologize for adding in the possibility of using
retail RSA keys; they would be so hard for us to get it wouldn't even be
funny having them. However, when homebrew is available to this community
the output should be usable, as a homebrew loader would not check the
signature.

# Notes from users

~~This application may not generate completely perfect files yet.~~
Banner output has been checked. It is proper data if the program is used
properly. The same goes for the ICN.

# General information

## Introduction

Over the past weeks I have been working on Project CiTRUS (citrus).
Currently this tool boasts the capability to output proper Nintendo 3DS
(CTR) BaNneR and ICoN files using my XBSF format.

You may notice that *creating* these formats is not yet available in any
other released tool. Over the course of time I will do my best to add
creating new formats of 3DS files among various other calculations if I
see users are liking the program.

------------------------------------------------------------------------

If you have v0.1 please update it! There are new bug fixes, GUI changes,
and updates! It is also more n00b compliant than the previous version.
(now has a lot of help text)

I do not include an editor for the image formats, however, I do include
an example of each required file for generating a test banner/icon. I do
this not to troll, but rather in the hopes that it will encourage other
talented users to make programs for the 3DS.

------------------------------------------------------------------------

## USE

Since v0.2, a readme is not really necessary anymore. I've included
helpful text inside each tab in the CiTRUS window to do things
on-the-fly without needing to switch between notepad (or your favourite
text editor) and CiTRUS.

INPUT:

- 1x XBSF (Xtended Banner Specifications(Spec) File)
- 2x CTPK (CTR Texture PacKage)
- 1x BCWAV (Banner CTR Wave)
- 1x CBMD (CTR Banner Model Data)

OUTPUT:

- 1x BNR (Optional)
- 1x ICN (Optional)

## ISSUES

I don't think there is any, but since this is a beta please report to me
if there are issues that come about!

## UPCOMING

5/7/2012

Well, it's been a fun 7 months so far.

Encrypted, proper CXI:

<http://www.mediafire.com/?hcm1p6fq4x7q14o>

Signatures, Hashes, ExeFS, Extended Header, Flags\[-\], NCCH header, and
encryption are now valid. The only thing left now is the RomFS.

\[-\] = It seems flags for developer applications may differ from retail
application flags, but it is not a big deal as when retail applications
can be decrypted I can replace and change my flags to fit retail needs.
The generated CXIs would still require an exploit to run on a retail
3DS, however. The flags are already laid out and are valid developer
flags, though.

## UPDATES

Version 0.2:

- Fix: "Polish" changed "Portuguese"
- Fix: Can now Set region to Taiwan
- Fix: Can now Set rating to true

<!-- -->

- Add: Colour scheme of menu items to match colour scheme menu bar
- Add: ComboBox for regions and ratings
- Add: Checkboxes instead of true/false typing
- Add: Automatic saving before building
- Add: Banner writing progress bar/notification of finishing
- Add: Help box incorporated into each tab (except title name/publisher
  tabs because those are not so complicated)
- Add: Name now reflects what's on here (CiTRUS) and version number
  (v0.2)

## MEDIA

<figure>
<img src="../CiTRUS_v0.1.png" title="File:CiTRUS_v0.1.png" />
<figcaption><a
{{% href "../File:CiTRUS_v0.1.png" %}}>File:CiTRUS_v0.1.png</a></figcaption>
</figure>
