# Authoring guide for the AMATH 301 notes

A quick reference for editing these notes. This file is for you; it isn't part of the website.

## Previewing and building

1. Install Quarto (free, no MATLAB needed): <https://quarto.org/docs/get-started/>. Version 1.8 or newer.
2. Open a terminal in this folder and run:

   ```
   quarto preview
   ```

   This opens the site in your browser and refreshes it every time you save a file.
3. When you're ready to publish, run `quarto render`. The finished website is the `_book/` folder. Upload that whole folder to wherever you host it (GitHub Pages, UW web space, Quarto Pub, ...).

You can also edit and preview in VS Code or RStudio with the Quarto extension.

## Where things live

| File or folder | What it is |
|---|---|
| `_quarto.yml` | Book structure (sidebar order), theme, settings |
| `_variables.yml` | **This quarter's** PREP links and homework/quiz checkpoints. Update every quarter. |
| `index.qmd` | Home page with the "do the PREP first" note |
| `lesson-index.qmd` | Table of class meetings → sections → files |
| `basics/*.qmd` | One file per chapter |
| `files/` | `.m` files students download |
| `figures/` | PNG figures (export them from MATLAB with `exportgraphics`) |
| `styles.css` | Look of the checkpoint, reminder, exercise, motivation, and lesson-file boxes |
| `_a11y.html` | Makes collapsible boxes work with the keyboard. Leave as is. |
| `_motivation.lua` | Hides all motivation blocks when `show-motivations: false`. Leave as is. |
| `reference/style-guide.qmd` | MATLAB figure style guide (Appendix A). Link to a section with, e.g., `../reference/style-guide.qmd#hold-on`. |
| `_archive/` | Earlier narrative versions of the chapters. Not published. |

### Adding a chapter

Create the `.qmd` file, then add its path under the right `part` in `_quarto.yml`. Order in `_quarto.yml` = order in the sidebar.

## Writing a page

Headings: `#` is the chapter title (one per file), `##` is a section, `###` is a subsection. Don't skip levels (no `####` right after `##`); screen readers use headings to navigate.

Give a section an id if you want to link to it:

```
## Slicing {#sec-slicing}
```

Then link to it from anywhere with `@sec-slicing` (becomes "Section 2.3"), or with a normal link: `[slicing](arrays.qmd#sec-slicing)`.

### MATLAB code

````
```matlab
y = [10 20 30 40 50];
y(end:-1:1)   % 50 40 30 20 10
```
````

Every code block gets line numbers automatically (`code-line-numbers: true` in `_quarto.yml`), so the text can say "line 5". Code isn't run, so write any output you want students to see yourself. For a short result, use a trailing comment (`y(end)   % 1`). For longer output, put an output block right after the code; it gets a gray "Output" label:

````
``` {.output}
x =

   -1.0000   -0.5000         0    0.5000    1.0000
```
````

## The building blocks

### "In class" aside (collapsed)

```
::: {.callout-note collapse="true"}
## In class: How do I flip an array?

Representative version of the question, a few small experiments, then
**Takeaway:** one sentence.
:::
```

### Practice (collapsed)

````
:::: {.callout-tip collapse="true"}
## Practice: identify the error

The problem, with any code.

::: {.callout-caution collapse="true"}
## Answer

The answer.
:::
::::
````

### Try it

```
::: {.callout-tip}
## Try it

Change the step in `1:2:9` to 3. What changes?
:::
```

### Common mistake

```
::: {.callout-warning}
## Common mistake: forgetting the `.` in `.*`

Explanation and fix.
:::
```

### Side note (always open)

```
::: {.callout-note appearance="simple"}
Note that `e-16` means 10^-16 ...
:::
```

Use these for the PREP's small "notice that..." boxes.

### Learning objectives (top of each chapter)

```
::: {.callout-note appearance="simple"}
## Learning objectives

- ...
:::
```

### Motivation (start of a section)

```
::: {.motivation}
One to three sentences on why this section matters.
:::
```

Delete any single motivation by deleting its block. To hide **all** of them at once, set `show-motivations: false` in `_quarto.yml` (the `_motivation.lua` filter removes them when the site is built).

### In-class exercise

````
::::: {.exercise}
### Exercise: Changing launch conditions {#sec-ex-changing}

**Lesson files:** [Lesson_3_arrays.m (starter)](../files/Lesson_3_arrays.m) · [Lesson_3_arrays.m (completed)](../files/Lesson_3_arrays_Completed.m)

**Learning outcomes.** This exercise should help you to:

- ...

:::: {.callout-note collapse="true" appearance="simple"}
## Full exercise

The problem statement, as students saw it in class.

::: {.callout-tip collapse="true" appearance="simple"}
## Takeaways and common mistakes


**Key takeaways**

- ...

**Common mistakes**

- ...
:::
::::
:::::
````

Each level of nesting needs a longer colon fence: five for the exercise box, four for "Full exercise", three for the summary inside it. Paths start with `../` because chapters are inside `basics/`. To link to MATLAB Drive instead, paste the share link in place of the path.

### Lesson files (outside an exercise)

```
::: {.lesson-files}
**Lesson files:** [file.m (starter)](../files/file.m) · [file.m (completed)](../files/file_Completed.m)
:::
```


### Homework / quiz checkpoint

```
::: {.checkpoint}
{{< var checkpoints.arrays >}} cover up through here.
:::
```

The text comes from `_variables.yml`, so next quarter you only change the numbers there. To add a new checkpoint, add a line under `checkpoints:` in `_variables.yml` and use its name here.

### PREP reminder (top of each chapter)

```
::: {.prep-reminder}
{{< var notes-reminder >}} The PREP for this topic: [PREP: Arrays]({{< var prep.arrays >}}).
:::
```

The reminder sentence and the PREP links are in `_variables.yml`.

### Figures (with alt text)

```
![Caption shown under the figure.](../figures/my_plot.png){fig-alt="What a screen-reader user should take away from the plot."}
```

Every figure needs `fig-alt`. Describe what to *notice* (e.g., "with 8 points the curve is jagged; with 100 it looks smooth"), not just "a plot." In your MATLAB plots, tell lines apart with line styles or markers and a legend, not color alone.

### Math

Inline: `$y = 1 + \sin(2\pi t)$`. Display: `$$x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$$`.

## Checking accessibility

`_quarto.yml` has `axe: true`, which reports accessibility problems in your browser's developer console (right-click → Inspect → Console). To see the problems on the page itself while you check, change it to:

```yaml
    axe:
      output: document
```

Change it back before publishing, or students will see the report too.

## Archive

`_archive/` holds the earlier, more narrative versions of the chapters (`_archive/narrative/`) and the tone-comparison script. Quarto ignores folders that start with `_`, so none of this is published. Delete the folder whenever you no longer need it.
