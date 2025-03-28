package application.controller;

import application.model.Genre;
import application.service.GenreService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/generos")
public class GenreController {
    @Autowired
    private GenreService genreService;

    // Listar todos os gêneros
    @GetMapping
    public String listGenres(Model model) {
        model.addAttribute("generos", genreService.getAllGenres());
        return "generos/list";
    }

    // Formulário de novo gênero
    @GetMapping("/novo")
    public String showNewGenreForm(Model model) {
        model.addAttribute("genre", new Genre());
        return "generos/form";
    }

    // Salvar novo gênero
    @PostMapping("/novo")
    public String saveGenre(@Valid @ModelAttribute("genre") Genre genre, 
                             BindingResult result, 
                             RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "generos/form";
        }
        
        genreService.saveGenre(genre);
        redirectAttributes.addFlashAttribute("message", "Gênero criado com sucesso!");
        return "redirect:/generos";
    }

    // Formulário de edição
    @GetMapping("/editar/{id}")
    public String showEditGenreForm(@PathVariable Long id, Model model) {
        Genre genre = genreService.getGenreById(id)
            .orElseThrow(() -> new IllegalArgumentException("ID de gênero inválido"));
        model.addAttribute("genre", genre);
        return "generos/form";
    }

    // Atualizar gênero
    @PostMapping("/editar/{id}")
    public String updateGenre(@PathVariable Long id, 
                               @Valid @ModelAttribute("genre") Genre genre, 
                               BindingResult result, 
                               RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "generos/form";
        }
        
        genre.setId(id);
        genreService.updateGenre(genre);
        redirectAttributes.addFlashAttribute("message", "Gênero atualizado com sucesso!");
        return "redirect:/generos";
    }

    // Excluir gênero
    @GetMapping("/excluir/{id}")
    public String deleteGenre(@PathVariable Long id, 
                               RedirectAttributes redirectAttributes) {
        genreService.deleteGenre(id);
        redirectAttributes.addFlashAttribute("message", "Gênero excluído com sucesso!");
        return "redirect:/generos";
    }
}