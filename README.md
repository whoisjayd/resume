# resume

<p align="center">
  <img src="resume/Jaydeep_Solanki_CV_1.png" alt="CV preview" width="450"/>
</p>

Current positioning: backend, DevOps, and cloud engineering. Projects on the CV: [NoteWise](https://github.com/whoisjayd/notewise), [PulseWatch](https://github.com/whoisjayd/pulsewatch), [BlazeServe](https://github.com/whoisjayd/blazeserve).

## Layout

- `cv.yaml` - content: experience, skills, projects, education
- `design.yaml` - `engineeringresumes` theme, colors, fonts, spacing
- `locale.yaml` - English locale catalog
- `settings.yaml` - render settings

## Render

```bash
# activate the venv (Windows)
.venv\Scripts\activate

rendercv render cv.yaml --design design.yaml --locale-catalog locale.yaml --settings settings.yaml

# re-render on every save
rendercv render cv.yaml -d design.yaml -lc locale.yaml -s settings.yaml --watch
```

Output goes to `rendercv_output/` as `Jaydeep_Solanki_CV.pdf` with one PNG per page. The `resume/` folder holds the copies I publish.

## Setup

The `.venv/` folder (gitignored) holds Python 3.14 with `rendercv[full]`. To rebuild it:

```bash
uv venv
uv pip install "rendercv[full]"
```
