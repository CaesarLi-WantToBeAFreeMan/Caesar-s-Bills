package com.triblec.caesar.bill;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface BillRepository extends JpaRepository <Bill, Long>{
    List <Bill> findByDate(LocalDate date);
    Page <Bill> findByDate(LocalDate date, Pageable pageable);
    long countByDate(LocalDate date);
    @Query("SELECT SUM(b.price) FROM Bill b WHERE b.date = :date")
    Double getTotalCostByDate(@Param("date") LocalDate date);
}