import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  final apiKey = 'AIzaSyBvBJqvgSMpQL1lekg9IYQxkshTaGanST8';
  if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }
  
  // The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  
  // List to store the conversation history
  List<String> conversationHistory = [];
  
  // Function to generate response and update conversation history
  Future<void> generateAndRespond(String newMessage) async {
    // Add new message to the history
    conversationHistory.add('User: $newMessage');
    
    // Combine conversation history into a single prompt
    final combinedPrompt = conversationHistory.join('\n');
    
    // Generate response
    final content = [Content.text(combinedPrompt)];
    final response = await model.generateContent(content);
    
    // Add AI response to the history
    conversationHistory.add('AI: ${response.text}');
    
    // Print the response
    print(response.text);
  }
  
  // Example usage
  await generateAndRespond('halo nama saya muhammad ridho');
  await generateAndRespond('coba cari tau apa arti nama saya');
  await generateAndRespond('berapa huruf dari nama saya tersebut');
}

