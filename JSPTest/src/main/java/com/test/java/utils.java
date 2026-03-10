package com.test.java;

public class utils {

    public static String formatFileSize(long bytes) {
        if (bytes >= 1024 * 1024) {
            return String.format("%.1f MB", bytes / (1024.0 * 1024.0));
        } else if (bytes >= 1024) {
            return String.format("%.1f KB", bytes / 1024.0);
        } else {
            return bytes + " B";
        }
    }

    public static String getExtension(String fileName) {
        int idx = fileName.lastIndexOf(".");
        if (idx == -1) return ""; // 확장자 없는 파일
        return fileName.substring(idx + 1).toLowerCase();
    }

}
