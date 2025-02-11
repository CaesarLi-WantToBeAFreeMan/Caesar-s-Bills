package com.triblec.caesar.bill;

import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping("/data/bills")
public class BillController{
    @Autowired
    private BillService billService;

    @GetMapping
    public ResponseEntity <List <Bill>> getAllBillsByDate(@RequestParam String date){
        List <Bill> bills = billService.getAllBillsByDate(LocalDate.parse(date));
        return bills.isEmpty() ? ResponseEntity.ok(Collections.emptyList())
                               : ResponseEntity.ok(bills);
    }

    @GetMapping("/{id}")
    public ResponseEntity <Bill> getBillById(@PathVariable Long id){
        Bill bill = billService.getBillById(id);
        return bill == null ? ResponseEntity.notFound().build()//return 404 not found
                            : ResponseEntity.ok(bill);
    }

    @GetMapping("/date")
    public ResponseEntity <Page <Bill>> getBillsByDate(
            @RequestParam String date,
            @RequestParam int page,
            @RequestParam int size
    ){
        Page <Bill> bills = billService.getBillsByDate(LocalDate.parse(date), page, size);
        return ResponseEntity.ok(bills);
    }

    @GetMapping("/countByDate")
    public long getBillCountByDate(@RequestParam String date){
        return billService.getBillCountByDate(LocalDate.parse(date));
    }

    @GetMapping("/totalCost")
    public ResponseEntity <Double> getTotalCostByDate(@RequestParam String date){
        return ResponseEntity.ok(billService.getTotalCostByDate(LocalDate.parse(date)));
    }

    @PostMapping
    public ResponseEntity <Bill> createBill(@RequestBody Bill bill){
        return ResponseEntity.status(HttpStatus.CREATED).body(billService.createBill(bill));//return 201 created
    }

    @PutMapping("/{id}")
    public ResponseEntity <Bill> updateBill(@PathVariable Long id, @RequestBody Bill bill){
        Bill updatedBill = billService.updateBill(id, bill);
        return updatedBill == null ? ResponseEntity.notFound().build()//return 404 not found
                                   : ResponseEntity.ok(updatedBill);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity <Bill> deleteBill(@PathVariable Long id){
        billService.deleteBill(id);
        return ResponseEntity.noContent().build();//return 204 no content
    }
}