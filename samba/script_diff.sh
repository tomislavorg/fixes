target_dir="/mnt/d/Books"
output_file="directory_comparison.txt"

# Function to list files and directories recursively
function list_files() {
  find "$target_dir" -type f -printf "%P\n" | sort > "$output_file"
}


# Call the function to generate the list
list_files