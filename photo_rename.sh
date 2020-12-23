#!/bin/bash

pixel_time_capture="(?P<hour>[0-9]{2})(?P<min>[0-9]{2})(?P<sec>[0-9]{2})"
pixel_date_capture="(?P<year>[0-9]{4})(?P<month>[0-9]{2})(?P<day>[0-9]{2})"

whatsapp_date_capture="(?P<year>[0-9]{4})-(?P<month>[0-9]{2})-(?P<day>[0-9]{2})"

pixel_modes_match="[0-9]{5}[lsr]{0,2}(?:PORTRAIT|IMG)_[0-9]{5}_BURST${pixel_date_capture}${pixel_time_capture}(?P<stuff>.*)"
pixel_modes_match2="(?:IMG_|VID_|MVIMG_|PANO_|)${pixel_date_capture}_${pixel_time_capture}(?P<stuff>.*)"
pixel_modes_match_screenshot="(?:Screenshot_|)${pixel_date_capture}-${pixel_time_capture}(?P<stuff>.*)"

iphone_time_capture="(?P<hour>[0-9]{2}).(?P<min>[0-9]{2}).(?P<sec>[0-9]{2})"
iphone_date_capture="(?P<year>[0-9]{4})-(?P<month>[0-9]{2})-(?P<day>[0-9]{2})"
iphone_match="${iphone_date_capture} ${iphone_time_capture}(?P<stuff>.*)"

whatsapp_match="${whatsapp_date_capture}(?P<stuff>.*)"

replace_datetime='$+{year}_$+{month}_$+{day}_$+{hour}-$+{min}-$+{sec}'

rename "s/^$pixel_modes_match$/${replace_datetime}_$+{stuff}/s" "$@"
rename "s/^$pixel_modes_match2$/$replace_datetime$+{stuff}/s" "$@"
rename "s/^$pixel_modes_match_screenshot$/${replace_datetime}_screenshot$+{stuff}/s" "$@"
rename "s/^$iphone_match$/$replace_datetime$+{stuff}/s" "$@"
#rename "s/^$whatsapp_match$/$+{year}_$+{month}_$+{day}$+{stuff}/s" "$@"
