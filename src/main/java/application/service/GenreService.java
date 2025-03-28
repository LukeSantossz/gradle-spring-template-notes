package application.service;

import application.model.Genre;
import application.repository.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GenreService {
    @Autowired
    private GenreRepository genreRepository;

    // Create
    public Genre saveGenre(Genre genre) {
        return genreRepository.save(genre);
    }

    // Read All
    public List<Genre> getAllGenres() {
        return genreRepository.findAll();
    }

    // Read by ID
    public Optional<Genre> getGenreById(Long id) {
        return genreRepository.findById(id);
    }

    // Update
    public Genre updateGenre(Genre genre) {
        return genreRepository.save(genre);
    }

    // Delete
    public void deleteGenre(Long id) {
        genreRepository.deleteById(id);
    }
}