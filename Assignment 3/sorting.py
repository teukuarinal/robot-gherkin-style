def custom_sort(arr):
    even_numbers = sorted([num for num in arr if num % 2 == 0], reverse=True)
    odd_numbers = sorted([num for num in arr if num % 2 != 0], reverse=True)
    return even_numbers + odd_numbers

input_array = [3, 2, 5, 1, 8, 9, 6]
output_array = custom_sort(input_array)
print("Sorted Output:", output_array)