package com.jhta.afterpay.payment;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class PaymentDao {
    public void insertPayment(Payment payment) {
        String sql = """
                INSERT INTO PAYMENTS
                (PAYMENT_NO, PAYMENT_PRICE, ORDER_NO)
                VALUES 
                (?, ?, ?)
                """;
        DaoHelper.insert(sql
                , payment.getNo()
                , payment.getPrice()
                , payment.getOrder().getNo()
        );
    }

    public void updatePayment(Payment payment) {
        String sql = """
                UPDATE PAYMENTS
                SET PAYMENT_PRICE = ? 
                WHERE PAYMENT_NO = ?   
                """;
        DaoHelper.update(sql
                , payment.getPrice()
                , payment.getNo());
    }

    public void deletePayment(Payment payment) {
        String sql = """
                DELETE FROM PAYMENTS
                WHERE PAYMENT_NO = ?
                """;
        DaoHelper.delete(sql
        , payment.getNo());
    }

    public Payment getPaymentByNo(int paymentNo) {
        String sql = """
                SELECT * 
                FROM PAYMENTS
                WHERE PAYMENT_NO = ?
                """;

        return DaoHelper.selectOne(sql
            , rs -> {
            Payment payment = new Payment();
            payment.setNo(rs.getInt("PAYMENT_NO"));
            payment.setPrice(rs.getInt("PAYMENT_PRICE"));
            payment.getOrder().setNo(rs.getInt("ORDER_NO"));
            payment.setCreatedDate(rs.getDate("CREATED_DATE"));

            return payment;
        }
        );
    }

    public List<Payment> getAllPaymentsByOrderNo(int orderNo) {
        String sql= """
                SELECT *
                FROM PAYMENTS
                WHERE ORDER_NO = ?
                """;

        return DaoHelper.selectList(sql
             ,   rs -> {
                Payment payment = new Payment();






                    return payment;
                }

                );
    }
}
