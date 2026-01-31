package utils;

import java.time.LocalDateTime;

public class HttpUtils {

    // 1. Hàm chuyển đổi Long an toàn
    public static Long toLong(String value) {
        try {
            return Long.valueOf(value);
        } catch (NumberFormatException | NullPointerException e) {
            return 0L; // Trả về 0 nếu lỗi
        }
    }

    // 2. Hàm chuyển đổi Int an toàn
    public static int toInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException | NullPointerException e) {
            return 0; // Trả về 0 nếu lỗi
        }
    }

    // 3. Hàm chuyển đổi LocalDateTime an toàn
    public static LocalDateTime toLocalDateTime(String value) {
        try {

            if (value != null && !value.isEmpty()) {

                return LocalDateTime.parse(value);
            }
        } catch (Exception e) {

            System.out.println("Lỗi parse ngày giờ: " + value);
        }

        return LocalDateTime.now();
    }

}
