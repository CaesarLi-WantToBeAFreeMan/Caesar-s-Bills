package com.triblec.caesar.bill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BillService{
    @Autowired
    private BillRepository billRepository;

    public List <Bill> getAllBills(){
        return billRepository.findAll();
    }

    public Bill getBillById(Long id){
        return billRepository.findById(id).orElse(null);
    }

    public Bill createBill(Bill bill){
        if(bill.getDate() == null)
            throw new IllegalArgumentException("Date is null");
        bill.setId(null);
        return billRepository.save(bill);
    }

    public Bill updateBill(Long id, Bill newBill){
        Bill oldBill = billRepository.findById(id).orElse(null);
        if(oldBill == null)
            return null;
        oldBill.setItem(newBill.getItem());
        oldBill.setPrice(newBill.getPrice());
        oldBill.setDate(newBill.getDate());
        return billRepository.save(oldBill);
    }

    public void deleteBill(Long id){
        billRepository.deleteById(id);
    }
}