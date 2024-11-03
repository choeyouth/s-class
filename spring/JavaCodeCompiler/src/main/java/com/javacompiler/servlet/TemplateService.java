package com.javacompiler.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TemplateService {
    public String getTemplateCode(int seq) {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String password = "oracle";
        
        String templateCode = null;

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT code FROM basicTemplate WHERE seq = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, seq);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                templateCode = rs.getString("code");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return templateCode;
    }
}
