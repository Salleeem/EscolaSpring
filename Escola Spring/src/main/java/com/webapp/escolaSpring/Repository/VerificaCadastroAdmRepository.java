package com.webapp.escolaSpring.Repository;

import org.springframework.data.repository.CrudRepository;

import com.webapp.escolaSpring.Model.VerificaCadastroAdm;


public interface VerificaCadastroAdmRepository extends CrudRepository<VerificaCadastroAdm,String>{
    VerificaCadastroAdm findByCpf(String cpf);
}
    
