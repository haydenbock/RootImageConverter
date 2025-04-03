# Install & load 'magick'; other options include 'terra'
install.packages("magick")
library(magick)


# Define the folder with .tif images
input_folder <- "path/to/your/tif_images"
output_folder <- "path/to/save/blackwhiteimages"

# Create output folder if it doesn't exist
if (!dir.exists(output_folder)) {
  dir.create(output_folder)
}

# List all .tif files in the input folder
tif_files <- list.files(input_folder, pattern = "\\.tif$", full.names = TRUE)

# Convert each image
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
