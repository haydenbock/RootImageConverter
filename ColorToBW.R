# Install & load 'magick'; other options include 'terra'
install.packages("magick")
library(magick)


# Define the folder with .tif images
input_folder <- "~/Library/CloudStorage/OneDrive-ThePennsylvaniaStateUniversity(2)/PennState/GitRepo/RootImageConverter/RawImages"
output_folder <- "~/Library/CloudStorage/OneDrive-ThePennsylvaniaStateUniversity(2)/PennState/GitRepo/RootImageConverter/BWImages"

#remove placeholder text file in each RawImages/BWImages folder prior to running the code.

# List all .tif files in the input folder
# NOTE - change to .jpeg$ or other file name if not .tif images
tif_files <- list.files(input_folder, pattern = "\\.tif$", full.names = TRUE)

# Iterative loop for reading through files.
for (file in tif_files) {
  # Read the image
  img <- image_read(file)
  
  # Convert to grayscale (preserving resolution)
  bw_img <- image_convert(img, colorspace = "gray")
  
  # Define output path
  output_path <- file.path(output_folder, basename(file))
  
  # Save the image
  image_write(bw_img, path = output_path, format = "tiff")
  
  message("Converted: ", basename(file))
}
