package org.penjualan;

import java.sql.*;

public class App {
    public static void main(String[] args) throws SQLException {
        DriverRegister register = new DriverRegister();
        register.regist();

        totalHarga();
        resultValue();
    }

    public static void totalHarga() throws SQLException {
        Connection connection = ConnectionUtil.getDataSource().getConnection();
        Statement statement = connection.createStatement();
        String sql = """
                select t.TANGGAL_TRANSAKSI as Tanggal,
                       t.NO_STRUK          as Bill,
                       t.CABANG_ID         as Kode_Cabang,
                       b.NAMA_CABANG       as Nama_Cabang,
                       t.TIPE_TRANSAKSI    as Type,
                       t.PRDUCT_ID         as Kode_Product,
                       p.NAMA_PRODUCT      as Nama_Product,
                       t.JUMLAH           as Qty,
                       p.HARGA_SATUAN      as Price,
                       sum(t.JUMLAH * P.HARGA_SATUAN) as total 
                               
                from TRANSACTION t
                         join PRODUCT p on (p.KODE_PRODUCT = t.PRDUCT_ID)
                         join BRANCH b on (b.KODE_CABANG = t.CABANG_ID)
                         group by t.TANGGAL_TRANSAKSI, t.NO_STRUK, t.CABANG_ID, b.NAMA_CABANG, t.TIPE_TRANSAKSI, t.PRDUCT_ID, p.NAMA_PRODUCT, t.JUMLAH, p.HARGA_SATUAN;
                 """;
        ResultSet resultSet = statement.executeQuery(sql);
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        int col = resultSetMetaData.getColumnCount();
        System.out.println("=============================================================================================================================================================================================================================");
        for (int i = 1; i <= col; i++) {
            System.out.printf("| %-17s |", resultSetMetaData.getColumnLabel(i));
        }
        System.out.println();
        System.out.println("=============================================================================================================================================================================================================================");

        // Loop data transactions
        while (resultSet.next()) {
            String date = resultSet.getString("Tanggal");
            String struk = resultSet.getString("Bill");
            String kodeCabang = resultSet.getString("Kode_Cabang");
            String namaCabang = resultSet.getString("Nama_Cabang");
            String type = resultSet.getString("Type");
            String kodeProduct = resultSet.getString("Kode_product");
            String nameProduct = resultSet.getString("Nama_Product");
            int quantity = resultSet.getInt("Qty");
            int prc = resultSet.getInt("Price");
            int total = resultSet.getInt("total");
            System.out.format("%10s %25s %11s %29s %15s %18s %30s %8s %23d %19s",
                    date, struk, kodeCabang, namaCabang, type, kodeProduct, nameProduct, quantity, prc, total);
            System.out.println();
            System.out.println();
        }

        // Close connection database
        resultSet.close();
        statement.close();
        connection.close();
    }

    public static void resultValue() throws SQLException {
        Connection connection = ConnectionUtil.getDataSource().getConnection();
        Statement statement = connection.createStatement();
        String sql = """
                select t.TIPE_TRANSAKSI, sum(p.HARGA_SATUAN * t.JUMLAH ) as total_harga
                from TRANSACTION t
                join PRODUCT P on (P.KODE_PRODUCT = t.PRDUCT_ID)
                group by TIPE_TRANSAKSI; """;
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            String tipe = resultSet.getString("TIPE_TRANSAKSI");
            Integer hasil = resultSet.getInt("total_harga");
            tipe = tipe + "       :";
            System.out.format("%-18s %-18s", tipe, hasil);
            System.out.println();

        }
        resultSet.close();
        statement.close();
        connection.close();

    }
}