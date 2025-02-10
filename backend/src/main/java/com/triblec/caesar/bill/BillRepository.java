package com.triblec.caesar.bill;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository <Bill, Long>{
    List <Bill> findByDate(LocalDate date);
    long countByDate(LocalDate date);
}