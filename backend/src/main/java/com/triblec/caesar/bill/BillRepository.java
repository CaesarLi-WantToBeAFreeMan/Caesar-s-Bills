package com.triblec.caesar.bill;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;

@Repository
public interface BillRepository extends JpaRepository <Bill, Long>{
    long countByDate(LocalDate date);
}