package com.asm.smarthome.coreservices.service.internal;

import com.asm.smarthome.coremodels.model.Pairing;
import com.asm.smarthome.coreservices.repository.PairingRepository;
import com.asm.smarthome.coreservices.service.PairingService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DefaultPairingService implements PairingService {
    private final PairingRepository pairingRepository;

    public DefaultPairingService(PairingRepository pairingRepository) {
        this.pairingRepository = pairingRepository;
    }


    @Override
    public List<Pairing> findAll() {
        return pairingRepository.findAll();
    }

    @Override
    public Page<Pairing> findAll(Pageable pageable) {
        return pairingRepository.findAll(pageable);
    }

    @Override
    public Pairing save(Pairing pairing) {
        return this.pairingRepository.save(pairing);
    }

    @Override
    public Optional<Pairing> findById(String id) {
        return pairingRepository.findById(id);
    }

    @Override
    public void delete(Pairing pairing) {
    pairingRepository.delete(pairing);
    }

    @Override
    public void deleteById(String id) {
    pairingRepository.deleteById(id);
    }
}
