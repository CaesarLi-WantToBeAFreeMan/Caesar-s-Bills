package com.triblec.caesar.bill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

@Service
public class BillService{
    @Autowired
    private BillRepository billRepository;

    public List <Bill> getAllBillsByDate(LocalDate date){
        List <Bill> bills = billRepository.findByDate(date);
        return bills == null || bills.isEmpty() ? Collections.emptyList()
                                                : bills;
    }

    public Page <Bill> getBillsByDate(LocalDate date, int page, int size){
        return billRepository.findByDate(date, PageRequest.of(page, size));
    }

    public Bill getBillById(Long id){
        return billRepository.findById(id).orElse(null);
    }

    public long getBillCountByDate(LocalDate date){
        return billRepository.countByDate(date);
    }

    public double getTotalCostByDate(LocalDate date){
        Double totalCost = billRepository.getTotalCostByDate(date);
        return totalCost == null ? 0.0
                                 : totalCost;
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