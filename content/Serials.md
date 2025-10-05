+++
title = 'Serials'
+++

This page talks about the 3DS products' serial number and model number structures (the console, manual, accessories, games, etc...).

## Console Serial Numbers

A 3DS console serial number is composed of at least two letters followed by nine decimal digits. The ninth digit is a "check digit", meaning that it is derived from the other digits.

The check digit is an industry-standard algorithm, the one used for UPC codes. To calculate the check digit of a 3DS console, separate the non-check digits into "odd" and "even" groups, where the "odd" group is digits in odd-numbered positions, and the "even" group is digits in even-numbered positions. (The first digit is "odd", with "first" representing "1".)

After separating the digits, add the digits in each group together. Multiply the sum of the even digits by 3, then add the sum of the odd digits. To calculate the check digit, take this value modulo 10, and if not 0, subtract from 10.

Example: CW404567772

The non-check digits are 40456777. Separating into odd and even groups, we get the following:

Odds: 4 + 4 + 6 + 7 = 21
Evens: 0 + 5 + 7 + 7 = 19

Applying the algorithm, we get ((3 \* 19) + 21) % 10 = 8, which is not 0, thus 10 - 8 = 2, matching the example's check digit.

The letter prefixes are a letter specifying the device, followed by one letter specifying the region in which it was sold. In some regions, a third letter is present; a current guess is that this letter distinguishes among factories for a given sales region. Note that several different sales regions' console may be considered to be the same region for region-locking purposes, such as Europe and Australia.

The current serial number scheme began with the DSi, hence its listing in the tables below. Among standalone consoles, the Wii U belongs to this scheme as well; the Switch started a new scheme.

| Model               | Device Prefix (Retail) | Device Prefix (Dev/Test) |
|---------------------|------------------------|--------------------------|
| *Wii*               | L                      | R                        |
| *DSi*               | T                      | V                        |
| *DSi XL/LL*         | W                      | D                        |
| *Nintendo Zone Box* | Z                      | *N/A*                    |
| *Wii U*             | F/G                    | *unknown*                |
| *Wii U gamepad*     | J                      | J                        |
| *3DS*               | C                      | E                        |
| *3DS XL/LL*         | S                      | R                        |
| *2DS*               | A                      | P                        |
| *New 3DS*           | Y                      | Y                        |
| *New 3DS XL/LL*     | Q                      | Q                        |
| *New 2DS XL/LL*     | N                      | N                        |

Some United Kingdom models' serial numbers will include "UH" after the device model prefix.

Test ("Panda") units with the same prefix as retail can be distinguished by test units having 00 or 01 as the first two digits of the serial number portion. 00 was used with the New 3DS and New 3DS XL for test units; 01 was used with the New 2DS XL test unit. Preview versions of the N2DS XL given out to the press had 01; these appear to have been test units with the development titles deleted.

Old 3DS development systems (Partner-CTR, IS-CTR-BOX, IS-SPR-BOX) use the "E" and "R" prefixes like test systems, but have 90 (Partner-CTR) or 91 (IS-CTR-BOX, IS-SPR-BOX) as their first two digits. Similarly, the main New 3DS development unit, IS-SNAKE-BOX, uses the Y prefix (same as retail) with 91. It is currently unknown what is the serial number format of the rare New 3DS XL development system (IS-CLOSER-BOX).

| Sales Region                 | Region Lock   | Region Suffix  |
|------------------------------|---------------|----------------|
| Japan                        | Japan         | JE, JF, JH, JM |
| North America                | North America | W              |
| Brazil                       | North America | B              |
| Middle East / Southeast Asia | North America | S              |
| Europe                       | Europe        | EE, EF, EH, EM |
| Australia                    | Europe        | AF, AH, AG, AM |
| South Korea                  | Korea         | KF, KH, KM     |
| China (iQue)                 | China         | CF, CH, CM     |

## Console Models

| Device                              | Product Code |
|-------------------------------------|--------------|
| *DS*                                | NTR          |
| *DS lite*                           | USG          |
| *DSi*                               | TWL          |
| *DSi XL/LL*                         | UTL          |
| *Wii U*                             | WUP          |
| 3DS                                 | CTR          |
| 3DS XL/LL                           | SPR          |
| 2DS                                 | FTR          |
| [New 3DS](New_3DS "wikilink")       | KTR          |
| [New 3DS](New_3DS "wikilink") XL/LL | RED          |
| New 2DS XL/LL                       | JAN          |

The DS had the product code NTR (short for Nitro), so we see the TR is recurring.

## Title ID and Unique ID

*see [Titles](Titles "wikilink")*

## NCCH Product Code

This serial is similiar to the "physical serial" described later in this page; it is the canonical identifier for a specific title in the field of business formalities with Nintendo, but this is not reflected in the 3DS's software architecture (where it is vastly unused in favor of the Title ID: it is therefore considered the successor of the "internal name" contained in ROMs of previous handhelds), is not guaranteed to be unique.

The product code is located in a [NCCH](NCCH "wikilink")'s header (not its ExHeader).

The product code "CTR-P-CTAP" is the default generic product code for NCCH files. Most [NCCHs apart from the first one](NCSD "wikilink") in a title are generally CTR-P-CTAP.
Referring to "the product code of a title" is therefore a simplification for "the product code of the NCCH in its first partition".

So, for example, a Japanese copy of Ridge Racer 3D would have a product code of "CTR-P-ARRJ" and a serial of "LNA-CTR-ARRJ-JPN".

A Nintendo-assigned product code follows this format, however, there is no requirement for a product code to match or resemble this structure as long as it's within the length limit:

\[CTR/KTR\]-\[Category letter\]-\[Type\]\[Identifier\]\[Region\]-\[Sub ID\]

| Category letter | Description |
|----|----|
| P | Cartridge software, or downloadable versions of them. |
| B | Cartridge demos |
| N | Digital-only releases, including [system applications and applets](Title_list "wikilink"). |
| M | [DLC](DLC "wikilink") |
| T | [eShop Demos](eShop_Demos "wikilink"), excluding so-called "special demos" which are category N. |
| U | [Patches](Title_list#0004000e---add-on-content-(updates) "wikilink") for category P titles. |

The "sub ID" only applies to DLC, demos, and local copies of Download Play titles. It's a 2-digit number associated with the [Title ID Variation](Title_list "wikilink").

See the next chapter for explanation of the other components of the Product Code.

## Physical Serial

\[Product\]\[Retail/Demo\]-\[Platform\]-\[Type\]\[Game ID\]\[Region\]-\[Label Region\]

| Field        | Length | Description                           | Values |
|--------------|--------|---------------------------------------|--------|
|              |        |                                       |        |
| Product      | 2      | Product type                          |        |
|              |        |                                       | LN     |
|              |        |                                       | MA     |
|              |        |                                       | TS     |
|              |        |                                       | FA     |
|              |        |                                       | MK     |
| Retail/Demo  | 1      |                                       |        |
|              |        |                                       | A      |
|              |        |                                       | Z      |
| CTR/KTR      | 3      | Platform                              |        |
|              |        |                                       | CTR    |
|              |        |                                       | KTR    |
| Type         | 1      |                                       |        |
|              |        |                                       | A      |
|              |        |                                       | B      |
|              |        |                                       | C      |
|              |        |                                       | E      |
|              |        |                                       | H      |
|              |        |                                       | J      |
|              |        |                                       | K      |
|              |        |                                       | S      |
|              |        |                                       | P      |
|              |        |                                       | T      |
| Identifier   | 2      | Game ID (two alphanumeric characters) |        |
| Region       | 1      |                                       |        |
|              |        |                                       | E      |
|              |        |                                       | P      |
|              |        |                                       | J      |
|              |        |                                       | K      |
|              |        |                                       | C      |
|              |        |                                       | Y      |
|              |        |                                       | W      |
|              |        |                                       | Z      |
|              |        |                                       | A      |
|              |        |                                       |        |
| Label Region | 3      |                                       |        |
|              |        |                                       | USA    |
|              |        |                                       | EUR    |
|              |        |                                       | CAN    |
|              |        |                                       | AUS    |
|              |        |                                       | JPN    |
|              |        |                                       | KOR    |
|              |        |                                       | TWN    |
|              |        |                                       | CHT    |
|              |        |                                       | CHN    |
|              |        |                                       | UKV    |
|              |        |                                       | MDE    |

### Electronic Manuals

Some eShop titles have [Electronic Manuals](NCCH#cfa "wikilink") which store the product code at the end of the 'Health & Safety' section of the manual. However, product codes can differ from the above format as shown below:

CTR-\[P/N/T/U\]-\[Type\]\[Game ID\]\[Region\]-\[Region\]-\[Digit\]

CTR-\[Type\]\[Game ID\]\[Region\]-\[Region\]-\[Digit\]

- P/N/T/U - Same as in product code structure
- \[Type\]\[Game ID\]\[Region\] - Same as in serial structure
- \[Region\] - A three character representation of the title region, i.e. 'EUR' (not always present)
- \[Digit\] - A single digit usually '1' or '0' (not always present). Possibly revision or manual revision.

**Note:** These alternate versions of the product code, potentially found in [Electronic Manuals](NCCH#cfa "wikilink") don't represent the actual product code, as found in the game's CXI. They are only found in the game's Home Menu manual, and on the game's packaging and external labeling.

## Back of Card Serial

AREPY10111 (example)

AAAABCDEEE  
**A** - Identifier (last 4 digits of product code)  
**B** - Production Month (numbers, then after Sep its X,Y,Z for Oct,Nov,Dec)  
**C** - Production Year (2010 + C)\*  
**D** - Revision/Remaster Version (should match the main NCCH's Exheader Remaster Version)  
**E** - Production Run? (000-999)\*\*

\* Or (2020 + C), if produced in that decade. Example [here](https://www.youtube.com/watch?v=DcH8mK6yXj4) at the 2:10 mark.  
\*\* European demo/kiosk carts have "08B" or "08H"
