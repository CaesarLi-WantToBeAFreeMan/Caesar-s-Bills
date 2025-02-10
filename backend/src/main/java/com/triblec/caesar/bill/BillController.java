package com.triblec.caesar.bill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/data/bills")
public class BillController{
    @Autowired
    private BillService billService;

    @GetMapping
    public List<Bill> getAllBills(){
        return billService.getAllBills();
    }

    @GetMapping("/{id}")
    public Bill getBillById(@PathVariable Long id){
        return billService.getBillById(id);
    }

    @GetMapping("/date")
    public List <Bill> getBillsByDate(@RequestParam("date") String dateString){
        System.out.println("dateString:\t" + dateString);
        LocalDate date = LocalDate.parse(dateString);
        return billService.getBillsByDate(date);
    }

    @GetMapping("/countByDate")
    public long getBillCountByDate(@RequestParam("date") String dateString){
        LocalDate date = LocalDate.parse(dateString);
        return billService.getBillCountByDate(date);
    }

    @PostMapping
    public Bill createBill(@RequestBody Bill bill){
        return billService.createBill(bill);
    }

    @PutMapping("/{id}")
    public Bill updateBill(@PathVariable Long id, @RequestBody Bill bill){
        return billService.updateBill(id, bill);
    }

    @DeleteMapping("/{id}")
    public void deleteBill(@PathVariable Long id){
        billService.deleteBill(id);
    }
}