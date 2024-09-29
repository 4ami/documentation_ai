
---

# Documentation AI

**Documentation AI** is an intelligent documentation generation tool powered by OpenAI GPT. It processes code files and generates tailored documentation for different user roles such as developers, CTOs, and board members. This ensures that each user receives the specific information they need.

## Features

- **Developer Documentation**: 
  - Automatically generates detailed API documentation.
  - Provides brief descriptions of functions, endpoints, and code structure.
  - Includes request structures, parameters, and possible responses in a clean HTML/CSS format.

- **CTO Documentation**: 
  - Generates a feature summary, highlighting the key elements of the codebase.
  - Provides an in-depth security analysis, outlining potential risks and mitigations.

- **Board Member Documentation**: 
  - Produces an executive summary of the project.
  - Includes financial considerations, such as cost-benefit analyses and resource requirements.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository/opensource-documentation-ai.git
   cd opensource-documentation-ai
   ```

2. Install the necessary dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Add your OpenAI API key:
   Create a `.env` file and add your OpenAI API key:
   ```
   OPENAI_API_KEY=your-openai-api-key
   ```

4. Run the application:
   ```bash
   python app.py
   ```

## Usage

Once the application is running, it will process your code files based on the roles of the user. You can upload code, choose the role of the user (Developer, CTO, or Board Member), and the tool will generate the appropriate documentation.

### Developer Example

For developers, the AI will generate an HTML/CSS page containing:
- API descriptions
- Request structures
- Sample responses

### CTO Example

For CTOs, the AI will produce a feature summary, along with:
- Security analysis
- Recommendations for improvements

### Board Member Example

For board members, the AI will deliver:
- A high-level executive summary
- Financial considerations relevant to the project

## Contributing

We welcome contributions from the community! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for more details on how to get involved.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---
