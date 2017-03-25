package com.crazy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.crazy.domain.Menu;

public interface IMenuDao extends JpaRepository<Menu, Integer> {

}
