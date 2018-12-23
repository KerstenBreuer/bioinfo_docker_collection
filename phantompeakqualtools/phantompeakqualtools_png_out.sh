
bam_ip="$1"
output_basename="$2"

# run phantompeakqualtools
Rscript /phantompeakqualtools-1.2/run_spp.R -c="$bam_ip" -savp="${output_basename}.pdf" -out="${output_basename}.txt" > "${output_basename}_phantompeakqualtools.log" 2>&1

#convert pdf output to jpg to be incorporated into the html report
convert -density 500 "${output_basename}.pdf" -quality 100 "${output_basename}.jpg"
